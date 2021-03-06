function stop = outputf_gw(x,optimvalues,state)
global Band_backup
% global tolB
persistent LL_backup

% save tmp1
% return

stop = false;
% tolB = 1.e-6;
if isequal(state,'init')
    disp('')
	fprintf('%6s %6s %8s %17s %18s \n','Iter.','Eval.','B','f(x)','df(x)');
end
    if isequal(state,'iter')
        if optimvalues.iteration == 0
            fprintf('%4d %6d %15.10f  %19.10f %15.10f \n',optimvalues.iteration,optimvalues.funccount,x,optimvalues.fval,0);
%             B_backup = [B_backup, x];
            Band_backup = x;
            LL_backup = optimvalues.fval;
        else
%             dB = max(abs(x - B_backup(:,end)));
            
            fprintf('%4d %6d %15.10f  %19.10f %15.10f \n',optimvalues.iteration,optimvalues.funccount,x,optimvalues.fval,LL_backup - optimvalues.fval);
%             B_backup = [B_backup, x];
            Band_backup = x;
            LL_backup = optimvalues.fval;
%             if dB < tolB 
%                 stop = true;
%                 disp(['Exiting optimalization due to change in parameters is lower than selected tolerance (',num2str(tolB),')'])
%             end
        end
    end
end