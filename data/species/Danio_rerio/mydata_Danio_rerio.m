  function [data, auxData, metaData, txtData, weights] = mydata_Danio_rerio

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Danio_rerio'; 
metaData.species_en = 'Zebra fish'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFp', '0iFm'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'L0'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wd0'; 'Wwi'; 'Ri'; 'GSI'}; 
metaData.data_1     = {'t-Le'; 't-Wwe'; 't-Wde'; 't-MCe'; 't-MNe'; 't-L_fT'; 't-Ww_f'; 't-N'; 't-S'; 'L-Ww'}; 

metaData.COMPLETE = 4.6; % using criteria of LikaKear2011

metaData.author   = {'Starrlight Augustine'};        
metaData.date_subm = [2011 05 02];                           
metaData.email    = {'sta@akvaplan.niva.no'};                 
metaData.address  = {'Akvaplan-niva AS, Fram Centre, P.O. Box 6606 Langnes, 9296 Tromso, Norway'}; 

metaData.author_mod_1   = {'Starrlight Augustine'};        
metaData.date_mod_1 = [2018 08 08];                           
metaData.email_mod_1    = {'starrlight.augustine@akvaplan.niva.no'};                 
metaData.address_mod_1  = {'Akvaplan-niva AS, Fram Centre, P.O. Box 6606 Langnes, 9296 Tromso, Norway'}; 

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2018 08 09]; 

%% set data
% zero-variate data
data.ab = 5;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'BestAdat2010'; 
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.aj = 22;     units.aj = 'd';    label.aj = 'age at metam';           bibkey.aj = 'BestAdat2010'; 
  temp.aj = C2K(25); units.temp.aj = 'K'; label.temp.aj = 'temperature';
  comment.aj = 'length at 1 cm';
data.ap = 75;     units.ap = 'd';    label.ap = 'age at puberty';         bibkey.ap = 'EatoFarl1974a'; 
  temp.ap = C2K(25.5);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = '(74 - 75 day of development)';
data.am = 4.5 * 365; units.am = 'd'; label.am = 'life span';              bibkey.am = 'GerhKauf2002';   
  temp.am = C2K(26); units.temp.am = 'K'; label.temp.am = 'temperature';

data.L0 = 0.07;   units.L0 = 'cm';   label.L0 = 'egg diameter';           bibkey.L0 = 'ForbPres2010';
  comment.L0 = 'yolk diameter 0.055 - 0.075 cm ForbPres2010, but egg diameter = 0.08 - 0.09 and yolk diameter around 0.05 UuliWolt2010';
data.Lb = 4e-1;   units.Lb = 'cm';   label.Lb = 'total length at birth';  bibkey.Lb = 'Schi2002';
  comment.Lb = 'Swim bladder inflates, active feeding, pronephric tubules';
data.Lj = 1;   units.Lj = 'cm';   label.Lj = 'total length at metam';  bibkey.Lj = 'Schi2002';
  comment.Lj = 'Adult fin and pigmentation pattern';
data.Lp = 2.6*1.25; units.Lp = 'cm'; label.Lp = 'total length at puberty';bibkey.Lp = 'EatoFarl1974a';
  comment.Lp = 'Female are between 2.4 - 2.6 cm SL in the study at first egg laying';
data.Li = 5;      units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = {'SpenGerl2008','Schi2002'}; 
  comment.Li = 'also Lawr pers. comm';

data.Wd0 = 100e-6; units.Wd0 = 'g';    label.Wd0 = 'egg dry weight';         bibkey.Wd0 = 'Augu2009';
data.Wwi = 1;      units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'Augu2009';

data.Ri = 240;    units.Ri = '#/d';  label.Ri = 'max reproduction';       bibkey.Ri = {'EatoFarl1974b'}; 
  temp.Ri = C2K(26);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
data.GSI = 0.15;  units.GSI = '-';   label.GSI = 'Gonado Somatic Index';  bibkey.GSI = {'ForbPres2010'}; 
  temp.GSI = C2K(26); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'values range from 0.1 - 0.15 and grow bigger with food regime';
  
% uni-variate data

% tim-length, larval growth curve T = 28.5 + 273 K total length
data.tL_Schi2002 = [... %  time since birth (day), TL  (mm) at 28.5 C
2.74878081e+000	3.18144185e+000
3.49815699e+000	3.45339935e+000
3.89010948e+000	2.98130930e+000
4.99499237e+000	4.06487831e+000
5.75012189e+000	4.13414737e+000
5.95281122e+000	3.66163105e+000
7.81666248e+000	4.67934293e+000
8.21053442e+000	4.13968890e+000
9.31349909e+000	5.29082189e+000
1.02885818e+001	4.27950408e+000
1.04586642e+001	4.95556313e+000
1.11888571e+001	5.90315340e+000
1.17950094e+001	4.55316667e+000
1.19401527e+001	6.10754867e+000
1.25175295e+001	5.77101109e+000
1.36435126e+001	6.11138510e+000
1.36684492e+001	5.23306215e+000
1.51710404e+001	5.64185269e+000
1.57138896e+001	6.52145270e+000
1.57311534e+001	5.91338391e+000
1.60751521e+001	7.13037580e+000
1.81436109e+001	7.60800737e+000
1.81685475e+001	6.72968441e+000
1.92945306e+001	7.07005843e+000
1.93175490e+001	6.25929945e+000
2.02139879e+001	8.01807497e+000
2.11813978e+001	7.27701132e+000
2.21430555e+001	6.73863611e+000
2.24832178e+001	8.09075420e+000
2.41616411e+001	8.97291360e+000
2.41731503e+001	8.56753323e+000
2.42230235e+001	6.81088907e+000
2.64270322e+001	9.18071727e+000
2.83254110e+001	8.98229156e+000
2.84993298e+001	9.52322265e+000
2.92717232e+001	8.98442291e+000
3.05524406e+001	1.05413608e+001
3.05639498e+001	1.01359804e+001
3.11317381e+001	1.01372592e+001
3.22442961e+001	1.09505776e+001
3.22941694e+001	9.19393169e+000
3.33875406e+001	1.06828811e+001
3.43204253e+001	1.11579550e+001
3.43511165e+001	1.00769436e+001
3.54406513e+001	1.17010192e+001
3.73025844e+001	1.27862933e+001
4.23858141e+001	1.37436896e+001
4.25980969e+001	1.29333551e+001
4.44542754e+001	1.42213211e+001
4.84230288e+001	1.44329613e+001
4.87862071e+001	1.49743204e+001
5.25618646e+001	1.53206622e+001
5.45938751e+001	1.70819953e+001];
data.tL_Schi2002(:,2) = data.tL_Schi2002(:,2)/10; % cm
units.tL_Schi2002 = {'d', 'cm'};  label.tL_Schi2002 = {'time since fertilization', 'total length'};  
  temp.tL_Schi2002 = C2K(28.5);  units.temp.tL_Schi2002 = 'K'; label.temp.tL_Schi2002 = 'temperature';
bibkey.tL_Schi2002 = {'Schi2002'};

% time-length at T = 25.5 + 273 K
data.tL_EatoFarl1974 = [... age (dpf), SL (mm)
4 3.35;
8 4.32;
15 5.54;
20 7.8;
25 9.6;
39 16.9;
54 22.2;
75 23.9]; % with possible range from (22 -26)
data.tL_EatoFarl1974(:,2)  = data.tL_EatoFarl1974(:,2)/ 10; % convert mm to cm
units.tL_EatoFarl1974 = {'d', 'cm'};  label.tL_EatoFarl1974 = {'time since birth', 'standard length'};  
  temp.tL_EatoFarl1974 = C2K(25.5);  units.temp.tL_EatoFarl1974 = 'K'; label.temp.tL_EatoFarl1974 = 'temperature';
bibkey.tL_EatoFarl1974 = {'EatoFarl1974b'};

% time-wet weight-dry weight data at T = 273 + 25 K
tLWWY = [ ... % age d, length mm, wet W mg, dry W mg, yolk mm^3
 4	3.9  .331  .061 .065;
 5	4.0  .338  .055 .055;
10	4.2  .397  .064 .030;
12	4.4  .440  .073 0;
14	4.6  .448  .075 0;
25	6.4  1.38  .180 0;
28	6.9  2.16  .350 0;
31	8.2  3.69  .610 0];
tLWWY(:,2) = tLWWY(:,2)/ 10; % convert mm to cm
tLWWY(:,[3 4 5]) = tLWWY(:,[3 4 5])/ 1000; % convert mg to g, mm^3 to cm^3
%
data.tL_BagaPels2001 = tLWWY(:, [1 2]);
units.tL_BagaPels2001 = {'d', 'cm'};  label.tL_BagaPels2001 = {'time since fertilization', 'total length'};
  temp.tL_BagaPels2001 = C2K(25);  units.temp.tL_BagaPels2001 = 'K'; label.temp.tL_BagaPels2001 = 'temperature';
bibkey.tL_BagaPels2001 = {'BagaPels2001'};
%
data.tWw_BagaPels2001 = tLWWY(:, [1 3]);
units.tWw_BagaPels2001 = {'d', 'g'};  label.tWw_BagaPels2001 = {'time since fertilization', 'wet weight'};
bibkey.tWw_BagaPels2001 = {'BagaPels2001'};
%
data.tWd_BagaPels2001 = tLWWY(:, [1 4]); 
units.tWd_BagaPels2001 = {'d', 'g'};  label.tWd_BagaPels2001 = {'time since fertilization', 'dry weight'};
bibkey.tWd_BagaPels2001 = {'BagaPels2001'};

% time-survival from GerhKauf2002 at T = 26 + 273 K,
data.tS  =[... % t in months and S in fraction of surviving individuals, -
1.69260404e+001	9.97518611e-001
1.80046222e+001	9.97518611e-001
1.90061639e+001	9.97518611e-001
2.00847457e+001	9.97518611e-001
2.10092460e+001	9.97518611e-001
2.21648691e+001	9.97518611e-001
2.30893683e+001	9.72704715e-001
2.40909099e+001	9.72704715e-001
2.50924504e+001	9.72704715e-001
2.60939920e+001	9.72704715e-001
2.70184912e+001	9.72704715e-001
2.79429904e+001	9.72704715e-001
2.90215711e+001	9.13151366e-001
2.99460714e+001	9.13151366e-001
3.08705717e+001	9.13151366e-001
3.19491524e+001	9.13151366e-001
3.29506929e+001	8.83374693e-001
3.39522357e+001	8.31265517e-001
3.48767337e+001	7.99007446e-001
3.60323591e+001	7.14640208e-001
3.69568572e+001	7.14640208e-001
3.80354401e+001	6.52605483e-001
3.90369806e+001	6.52605483e-001
4.00385211e+001	5.40942935e-001
4.10400638e+001	5.03722085e-001
4.19645619e+001	4.56575678e-001
4.28890622e+001	3.67245661e-001
4.39676429e+001	3.44913202e-001
4.49691856e+001	3.42431786e-001
4.68952220e+001	2.85359785e-001
4.78967670e+001	2.58064565e-001
4.88983075e+001	2.60545910e-001
5.00539284e+001	2.58064565e-001
5.09784287e+001	2.28287857e-001
5.19799692e+001	1.68734512e-001
5.28274293e+001	1.41439221e-001
5.39060100e+001	1.16625345e-001
5.49075505e+001	8.18858759e-002
5.59090910e+001	8.18858759e-002
5.69876761e+001	5.70720003e-002
5.78351318e+001	5.70720003e-002
5.89137125e+001	2.72952920e-002
5.99152575e+001	2.48138756e-002
6.08397533e+001	2.48138756e-002
6.19953787e+001	2.48138756e-002
6.29198790e+001	7.44417707e-003];
data.tS(:,1) = data.tS(:,1) * 30 ;  % convert months to days
units.tS = {'d', '-'}; label.tS = {'time since birth', 'surviving fraction'};      
  temp.tS = C2K(26); units.temp.tS = 'K'; label.temp.tS = 'temperature';
bibkey.tS = {'GerhKauf2002'};

% time-carbon mass from BangGron2004 in developing eggs
data.tMC = [ ... % time since fertilisation (h), mumol C
    24 3.11; 
    75 2.81];  
data.tMC(:,1) = data.tMC(:,1)/24; % convert h to d
units.tMC = {'d', 'mumol'}; label.tMC = {'age', 'C'};     
  temp.tMC = C2K(25); units.temp.tMC = 'K'; label.temp.tMC = 'temperature';
bibkey.tMC = {'BangGron2004'};
%
% time-nitrogen mass from BangGron2004 in developing eggs    
data.tMN = [ ... time since fertilisation (h), mumol N
    24 .572; 
    75 .538]; 
data.tMN(:,1) = data.tMN(:,1)/24; % convert h to d
units.tMN = {'d', 'mumol'}; label.tMN = {'age', 'N'};     
  temp.tMN = C2K(25); units.temp.tMN = 'K'; label.temp.tMN = 'temperature';
bibkey.tMN = {'BangGron2004'};

% BestAdat2010 T = 25 C, rotifers from day 5 till 9, then transition to
% regular feeding from 9 till 12 was originally given in personnal
% communication with C. Lawrence
% I digitalized all the points which in fact
% correspond to 2 different strains (AB and nacre)
% time-length
data.tL_BestAdat2010 = [... age (dpf), total length (cm)
5.00741992	0.30707071;
5.01034883	0.42828283;
5.97532950	0.36363636;
5.97698922	0.43232323;
6.99107806	0.40000000;
6.99215200	0.44444444;
7.96045210	0.51717172;
8.00731478	0.45656566;
8.97571251	0.53333333;
9.94401261	0.60606061;
10.95819908	0.57777778;
10.95946828	0.63030303;
11.97404528	0.61818182;
11.97648604	0.71919192;
16.03869925	0.83232323;
16.03996845	0.88484848;
23.10393150	1.22424242;
23.10481018	1.26060606;
30.17170214	1.72121212;
90 3.19;
90 3.41];
units.tL_BestAdat2010 = {'d', 'cm'}; label.tL_BestAdat2010 = {'time since fertilization', 'total length'}; 
  temp.tL_BestAdat2010 = C2K(25); units.temp.tL_BestAdat2010 = 'K'; label.temp.tL_BestAdat2010 = 'temperature';
bibkey.tL_BestAdat2010 = {'BestAdat2010'};
% time-length from study LawrEber2008, but the actual curves were given in pers.
% communication with C. Lawrence T = 28.5 C and there is about 50 %
% difference in food given between the high and the low food condition
data.tL_LawrEber2002_high = [... % day, cm T = 28 + 273 K Total Length
3.55e+00	3.89e-01 
1.07e+01	5.66e-01
1.09e+01	5.05e-01
1.09e+01	5.39e-01
1.80e+01	9.21e-01
1.82e+01	7.91e-01
1.82e+01	8.87e-01
2.55e+01	1.41e+00
2.55e+01	1.46e+00
2.56e+01	1.23e+00
2.56e+01	1.30e+00
3.28e+01	1.56e+00
3.28e+01	1.67e+00
3.28e+01	1.78e+00
3.28e+01	1.92e+00
4.01e+01	2.30e+00
4.01e+01	1.91e+00
4.01e+01	2.05e+00
4.02e+01	2.22e+00
4.74e+01	2.42e+00
4.74e+01	2.63e+00
4.75e+01	2.27e+00
5.46e+01	2.42e+00
5.47e+01	2.80e+00
5.47e+01	2.50e+00
6.19e+01	3.13e+00
6.20e+01	2.72e+00
6.20e+01	3.04e+00
6.20e+01	2.42e+00
6.92e+01	2.91e+00
6.92e+01	3.15e+00
6.92e+01	3.24e+00
6.93e+01	2.74e+00
7.65e+01	2.95e+00
7.65e+01	3.23e+00
7.66e+01	3.34e+00
7.66e+01	2.82e+00
8.38e+01	3.18e+00
8.38e+01	3.24e+00
8.38e+01	3.31e+00
8.38e+01	3.36e+00];
units.tL_LawrEber2002_high = {'d', 'cm'}; label.tL_LawrEber2002_high = {'time since birth', 'total length'}; 
  temp.tL_LawrEber2002_high = C2K(28.5); units.temp.tL_LawrEber2002_high = 'K'; label.temp.tL_LawrEber2002_high = 'temperature';
bibkey.tL_LawrEber2002_high = {'LawrEber2008'};
%
data.tL_LawrEber2002_low = [... % day, cm T = 28 + 273 K Total Length
3.55e+00	3.62e-01
1.09e+01	4.50e-01
1.81e+01	6.55e-01
2.55e+01	8.73e-01
2.55e+01	9.69e-01
3.28e+01	1.02e+00
3.28e+01	1.14e+00
3.28e+01	1.18e+00
3.99e+01	1.36e+00
4.74e+01	1.61e+00
4.74e+01	1.51e+00
4.74e+01	1.54e+00
4.75e+01	1.73e+00
5.47e+01	1.71e+00
5.47e+01	1.81e+00
6.19e+01	1.82e+00
6.20e+01	1.60e+00
6.20e+01	1.97e+00
6.92e+01	1.82e+00
6.92e+01	1.96e+00
6.93e+01	2.09e+00
6.93e+01	2.18e+00
7.66e+01	2.03e+00
7.66e+01	2.10e+00
7.66e+01	2.18e+00
8.37e+01	2.13e+00
8.37e+01	2.16e+00
8.37e+01	2.24e+00
8.38e+01	2.28e+00];
units.tL_LawrEber2002_low = {'d', 'cm'}; label.tL_LawrEber2002_low = {'time since birth', 'total length'}; 
  temp.tL_LawrEber2002_low = C2K(28.5); units.temp.tL_LawrEber2002_low = 'K'; label.temp.tL_LawrEber2002_low = 'temperature';
bibkey.tL_LawrEber2002_low = {'LawrEber2008'};
% 
data.tLf1 = [ ...
48.987	49.077	48.981	56.181	56.19	63.08	63.096	63.1	70.012	70.103	70.11	77.12	77.13	91.12	91.122	91.123	104.108	104.11	104.195;
16.025	15.375	13.895	18.978	17.44	22.108	21.576	20.747	24.233	23.582	22.812	24.937	23.635	27.883	26.818	26.227	29.707	28.701	28.05
 ]';
units.tLf1 = {'dpf', 'mm'}; label.tLf1 = {'time since fertilization', 'standard length'}; 
  temp.tLf1 = C2K(27.1); units.temp.tLf1 = 'K'; label.temp.tLf1 = 'temperature';
bibkey.tLf1 = {'BeauGous2015'};
%
data.tLf2 = [ ...
49.071	48.976	48.975	56.079	56.076	63.179	63.177	70.094	70.093	69.999	77.006	77.004	77.002	91.104	91.011	91.101	104.097	104.095	104.094;
13.185	12.239	11.943	15.96	14.895	18.44	17.907	20.682	20.327	19.972	22.156	21.505	20.854	24.096	23.682	22.972	26.216	25.506	25.091
 ]';
units.tLf2 = {'dpf', 'mm'}; label.tLf2 = {'time since fertilization', 'standard length'}; 
  temp.tLf2 = C2K(27.1); units.temp.tLf2 = 'K'; label.temp.tLf2 = 'temperature';
bibkey.tLf2 = {'BeauGous2015'};
comment.tLf2 = 'fasted once every three days';
%
data.tLf3 = [ ...
48.975	48.973	49.06	56.074	56.072	55.977	62.987	63.077	70.086	70.085	70.084	76.997	76.996	91.003	91.094	104.18	103.994;
11.883	11.41	9.872	14.126	13.712	12.706	15.895	15.185	18.256	17.724	17.487	19.079	18.842	21.256	20.783	22.961	22.429
]';
units.tLf3 = {'dpf', 'mm'}; label.tLf3 = {'time since fertilization', 'standard length'}; 
  temp.tLf3 = C2K(27.1); units.temp.tLf3 = 'K'; label.temp.tLf3 = 'temperature';
bibkey.tLf3 = {'BeauGous2015'};
comment.tLf3 = 'fasted every other day';

% time-fecundity over 19 days at 29 deg C:
tN = [ ... first line is time, next lines are egg spawed on that day. Each line
    % is an individual female
1	2	3	4	5	6	7	8	9	10	11	12	13	14	15	16	17	18	19	20
102	222	298	365	427	332	344	431	296	343	0	0	0	290	395	290	0	596	0	536
200	210	219	0	0	0	595	0	320	0	0	0	0	0	0	282	0	0	0	0
98	158	54	165	94	152	86	113	72	193	112	135	180	76	137	44	104	129	144	188
186	186	296	285	286	239	271	232	192	0	0	326	0	0	0	0	0	0	0	0
174	162	90	0	271	195	254	137	203	132	0	317	124	0	334	154	112	82	0	298
247	223	182	286	436	336	277	256	236	196	278	346	314	346	264	216	218	304	304	250
248	253	252	257	0	426	0	446	0	444	0	354	0	504	0	312	0	0	0	0
]';
fldnm = 'tN';
data.(fldnm) = [tN(:,1)-1, mean(cumsum(tN(:,2:end)),2)];
units.(fldnm) = {'d', '#'};  label.(fldnm) = {'time', 'cumulated number of eggs'};
temp.(fldnm) = C2K(29);  units.temp.(fldnm) = 'K'; label.temp.(fldnm) = 'temperature';
bibkey.(fldnm) = {'BeauGous2015'};
comment.(fldnm) = 'mean value, from raw data provided as courtesy of R. Beaudouin';
%
tL = [...
37	39.114
34	37.25
34	40.27
37	38.25
35	39.86
36	39.015
36	39.7
];
fldnm = 'tL1';
data.(fldnm) = [0 mean(tL(:,1))/10; 19 mean(tL(:,2))/10];
units.(fldnm) = {'d', 'cm'};  label.(fldnm) = {'time', 'standard length'};
temp.(fldnm) = [C2K(29) C2K(29)];  units.temp.(fldnm) = 'K'; label.temp.(fldnm) = 'temperature';
treat.(fldnm) = {0}; units.treat.(fldnm) = ''; label.treat.(fldnm) = '';
bibkey.(fldnm) = {'BeauGous2015'};
comment.(fldnm) = 'mean value, from raw data provided as courtesy of R. Beaudouin';
%
Ww = [ ...
882.6
656.8
859
628.6
1013.1
922.2
1080.4
];
% the final weights are treated as zero-variate data:
fldnm = 'Wwt';
data.(fldnm) = mean(Ww) * 1e-3;
units.(fldnm) = 'g';  label.(fldnm) = 'final wet weight';
temp.(fldnm) = C2K(29);  units.temp.(fldnm) = 'K'; label.temp.(fldnm) = 'temperature';
treat.(fldnm) = {0}; units.treat.(fldnm) = ''; label.treat.(fldnm) = '';
bibkey.(fldnm) = {'BeauGous2015'};
comment.(fldnm) = 'mean value, from raw data provided as courtesy of R. Beaudouin';

% time-starvation(ELS):
data.tS_starv = [... time (d)	survival probability
0	100
24	100
48	100
72	100
96	100
120	100
144	97
154	97
168	92
172	83
175	72
192	17
196	14
199	8
216	0
220	0];
data.tS_starv(:,1) = data.tS_starv(:,1)/24; % d, time since first exogenous feeding
data.tS_starv(:,2) = data.tS_starv(:,2)/100; % -, fraction surviving
units.tS_starv = {'d', '#'}; label.tS_starv = {'time since hatch', 'surviving larvae'};      
temp.tS_starv  = C2K(25); units.temp.tS_starv = 'K'; label.temp.tS_starv = 'temperature';
bibkey.tS_starv = {'GeffSimo2013'};
comment.tS_starv = 'time is in hours after fist exogenous feeding. Raw data from fig. 3 provided by the author as pers. comm.';

% starvation experiments (adults):
% time-length
data.tL = [... %
    0   24.9
    11  26.5];
units.tL = {'d', 'mm'};  label.tL = {'time', 'standard length'};
temp.tL = C2K(28.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
treat.tL = {0}; units.treat.tL = ''; label.treat.tL = '';
bibkey.tL = {'DrewRodn2008'};

% time-weight
data.tW = [... % time since start(d), wet weight (g)
-11  	0.3343
0    	0.4393
7       0.4607
14      0.4864
21      0.4886];
data.tW(:,1) = data.tW(:,1) + 11; % start time at 0
units.tW = {'d', 'g'};  label.tW = {'time', 'wet weight', 'fed'};
temp.tW =  C2K(28.5);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = {'DrewRodn2008'};
%
data.tWs = [... % time since start(d), wet weight (g)
-11	0.3257
0	0.4029
7	0.3536
14	0.3321
21	0.2957];
data.tWs(:,1) = data.tWs(:,1) + 11; % start time at 0
units.tWs = {'d', 'g'};  label.tWs = {'time', 'wet weight', 'starved'};
temp.tWs = C2K(28.5);  units.temp.tWs = 'K'; label.temp.tWs = 'temperature';
bibkey.tWs = {'DrewRodn2008'};
comment.tWs = 'starved condition'; 


% length - weight
data.LWw = [ ... total length, mm wet weight (g)
35.2	0.38
37.3	0.27
31.8	0.42
36.2	0.52
34.7	0.36
33.6	0.34
38.7	0.33
33.4	0.42
31.9	0.38
35.0	0.33
];
data.LWw(:,1) = data.LWw(:,1)/10; % mm to cm
units.LWw = {'cm', 'g'};  label.LWw = {'total length', 'wet weight'};
temp.LWw = C2K(26.4);  units.temp.LWw = 'K'; label.temp.LWw = 'temperature';
bibkey.LWw = {'Baye2005'};
comment.LWw = 'Rep 1'; 

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v   = 10 * weights.psd.v;


%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set3 = {'tL_LawrEber2002_high','tL_LawrEber2002_low'}; subtitle3 = {'LawrEber2002 data at high, low food'};
set5 = {'tLf1','tLf2','tLf3'}; subtitle5 = {'no fasting, fasting every 3 d, fasting every other day'};
set8 = {'tW','tWs'}; subtitle8 = {'fed, starved'};
metaData.grp.sets = {set3,  set5,  set8};
metaData.grp.subtitle = {subtitle3,  subtitle5,  subtitle8};


%% Discussion points
D1 = 'version 2018 08 08: KimBall95 and Augu2011 no longer included';
D2 = 'version 2018 08 08: studies by GomeConc2010, SchaRyan2006, BarrFern2010, BarrBurg1999, are not longer included. Previous version included them but gave them zero weight because growth deviates from what is assumed to be the normal patterns of growth at constant food (see EatoFarly1974,LawrEber2008,  Schi2002, BestAdat2010 and discussion in AuguGagn2011)';     
D3 = 'version 2018 08 08: it is no longer possible to implement different Arrhennius temperatures for embryo and adult';
D4 = 'version 2018 08 08: Egg respiration data from BangGron2004 is not longer included, the data show that the respiration stops quite early on while development and growth is very fast. We think this is an artefact. You can find back the data in the previous version.';
D5 = 'version 2018 08 08: inclusion of juvenile growth and adult reproduction data from BeauGous2015.';
D6 = 'version 2018 08 08: Buffer handling rules from AuguGagn2012 are used for modelling starvation response. We  estimate at adult females have  200 and 800 J in the reproduction buffer at the start of the trials. This is in line with finding from AuguGang2012'; 
D7 = 'version 2018 08 08: standard length is 80% of the total length:';
metaData.discussion = struct('D1',D1,'D2',D2,'D3',D3,'D4',D4,'D5',D5, 'D6', D6, 'D7', D7);
                                 
%% Links
metaData.links.id_CoL = '3443J'; % Cat of Life
metaData.links.id_ITIS = '163668'; % ITIS
metaData.links.id_EoL = '204011'; % Ency of Life
metaData.links.id_Wiki = 'Danio_rerio'; % Wikipedia
metaData.links.id_ADW = 'Danio_rerio'; % ADW
metaData.links.id_Taxo = '172875'; % Taxonomicon
metaData.links.id_WoRMS = '1026595'; % WoRMS
metaData.links.id_fishbase = 'Danio-rerio'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Zebrafish}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AuguGagn2011'; type = 'Article'; bib = [ ...  
'author = {S. Augustine and B. Gagnaire and C. Adam and S. A. L. M. Kooijman}, ' ...
'year = {2011}, ' ...
'title = {Developmental energetics of zebrafish, \emph{Danio rerio}}, ' ... 
'howpublished = {\url{https://www.zotero.org/groups/500643/deb_library/items/WFHER6ED/item-details}}, ' ...
'journal = {Comp. Physiol. Biochem. A}, ' ...
'volume = {159}, '...
'pages = {275-283}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SpenGerl2008'; type = 'Article'; bib = [ ...  
'author = {Spence, R. and Gerlach, G. and Lawrence, C. and Smith, C.}, ' ...
'year = {2008}, ' ...
'title = {The behaviour and ecology of the zebrafish, \emph{Danio rerio}}, ' ... 
'journal = {Biol. Rev.}, ' ...
'volume = {83}, '...
'pages = {13-34}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LawrEber2008'; type = 'Article'; bib = [ ...  
'author = {Lawrence, C. and Ebersole, J. P. and Kesseli, R. V.}, ' ...
'year = {2008}, ' ...
'title = {Rapid growth and out-crossing promote female development in zebrafish (\emph{Danio rerio})}, ' ... 
'journal = {Environ. Biol. Fish.}, ' ...
'volume = {81}, '...
'pages = {239-246}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BagaPels2001'; type = 'Article'; bib = [ ...    
'author = {Bagatto, B. and Pelster, B. and Burggren, W. W.}, ' ...
'year  = {2001}, ' ...
'title = {Growth and metabolism of larval zebrafish: effects of swim training}, ' ...  
'journal = {Journal of Experimental Biology}, ' ...
'volume = {204}, ' ...
'pages = {4335-4343}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BangGron2004'; type = 'Article'; bib = [ ...    
'author = {A. Bang and P. Gr{\o}nj{\ae}r and H. Malte}, ' ...
'year  = {2004}, ' ...
'title = {Individual variation in the rate of oxygen consumption by zebrafish embryos}, ' ...  
'journal = {Journal of Fish Biology}, ' ...
'volume = {64}, ' ...
'pages = {1285-1296}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BarrFern2010'; type = 'Article'; bib = [ ...    
'author = {Barrionuevo, W. R. and Fernandes, M. N. and Rocha, O.}, ' ...
'year  = {2010}, ' ...
'title = {Aerobic and anaerobic metabolism for the zebrafish, \emph{Danio rerio}, reared under normoxic and hypoxic conditions and exposed to acute hypoxia during development}, ' ...  
'journal = {Brazilian Journal of Biology}, ' ...
'volume = {70}, ' ...
'pages = {425-434}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BarrBurg1999'; type = 'Article'; bib = [ ...    
'author = {Barrionuevo, W. R. and Burggren, W. W.}, ' ...
'year  = {1991}, ' ...
'title = {O2 consumption and heart rate in developing zebrafish (\emph{Danio rerio}): Influence of temperature and ambient O2.}, ' ...  
'journal = {American Journal of Physiology - Regulatory Integrative and Comparative Physiology}, ' ...
'volume = {276}, ' ...
'pages = {505-513}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BestAdat2010'; type = 'Article'; bib = [ ...    
'author = {Best, J. and Adatto, I. and Cockington, J. and James, A. and Lawrence, C.}, ' ...
'year  = {2010}, ' ...
'title = {A novel method for rearing first feeding larval zebrafish: polyculture with {T}ype {L} saltwater rotifers (\emph{Brachionus plicatilis}).}, ' ...  
'journal = {Zebrafish}, ' ...
'volume = {352 7(3)}, ' ...
'pages = {89-295}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EatoFarl1974a'; type = 'Article'; bib = [ ...    
'author = {Eaton, R. C. and Farley, R. D.}, ' ...
'year  = {1974}, ' ...
'title = {Growth and the reduction of depensation of zebrafish, \emph{Brachydanio rerio}, reared in the laboratory}, ' ...  
'journal = {Copeia}, ' ...
'volume = {1}, ' ...
'pages = {204-209}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EatoFarl1974b'; type = 'Article'; bib = [ ...    
'author = {Eaton, R. C. and Farley, R. D.}, ' ...
'year  = {1974}, ' ...
'title = {Spawning cycle and egg production of zebrafish, \emph{Brachydanio rerio} in the laboratory}, ' ...  
'journal = {Copeia}, ' ...
'volume = {1}, ' ...
'pages = {195-204}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GerhKauf2002'; type = 'Article'; bib = [ ...    
'author = {Gerhard, G. S. and Kauffman, E. J. and Wang, X. and Stewart, R. and Moore, J. L. and Kasales, C. J. and Demidenko, E. and Cheng, K. C.}, ' ...
'year  = {2002}, ' ...
'title = {Life spans and senescent phenotypes in two strains of Zebrafish (\emph{Danio rerio})}, ' ...  
'journal = {Experimental Gerontology}, ' ...
'volume = {37(8-9)}, ' ...
'pages = {1055-1068}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GomeConc2010'; type = 'Article'; bib = [ ...    
'author = {Gomez-Requeni, P. and Concei{\c}{\a~}o, L. E. C. and Olderbakk Jordal, A. E. and R{\o}nnestad, I.}, ' ...
'year  = {2010}, ' ...
'title = {A reference growth curve for nutritional experiments in zebrafish (\emph{Danio rerio}) and changes in whole body proteome during development}, ' ...  
'journal = {Fish Physiology and Biochemistry}, ' ...
'doi = {10.1007/s10695-010-9400-0}, ' ...
'volume = {36}, ' ...
'pages = {1199-1215}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KimmBall1995'; type = 'Article'; bib = [ ...    
'author = {Kimmel, C. B. and Ballard, W. W. and Kimmel, S. R. and Ullmann, B. and Schilling, T. F.}, ' ...
'year  = {1995}, ' ...
'title = {Stages of embryonic development of the zebrafish}, ' ...  
'journal = {Developmental Dynamics}, ' ...
'volume = {203}, ' ...
'pages = {253-310}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LawrEber2008'; type = 'Article'; bib = [ ...    
'author = {Lawrence, C. and Ebersole, J. P. and Kesseli, R. V.}, ' ...
'year  = {2008}, ' ...
'title = {Rapid growth and out-crossing promote female development in zebrafish (\emph{Danio rerio})}, ' ...  
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {81}, ' ...
'pages = {239-246}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SchaRyan2006'; type = 'Article'; bib = [ ...    
'author = {J. Schaefer and A. Ryan}, ' ...
'year  = {2006}, ' ...
'title = {Developmental plasticity in the thermal tolerance of zebrafish \emph{Danio rerio}}, ' ...  
'journal = {Journal of Fish Biology}, ' ...
'volume = {69}, ' ...
'pages = {722-734}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Schi2002'; type = 'Incollection'; bib = [ ...    
'author = {Schilling, T. F.}, ' ...
'year  = {2002}, ' ...
'booktitle = {Zebrafish: a practical guide}, ' ...
'editor = {Nusslein-Volhard, C. and Dahm, R.}, ' ...
'title = {The morphology of larval and adult zebrafish}, ' ...  
'publisher = {Oxford University Press Inc.}, ' ...
'address = {New York}, ' ...
'pages = {59-83}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Augu2009'; type = 'Misc'; bib = [ ...
'year = {2009}, ' ...
'author = {S. Augustine}, ' ...
'note = {unpublished 2009, f = 1}'];  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ForbPres2010'; type = 'Article'; bib = [ ...
'author = {Forbes, E. L. and Preston, C. D. and Lokman, P. M.}, ' ...
'year  = {2010}, ' ...
'title = {Zebrafish (\emph{Danio rerio}) and the egg size versus egg number trade off: effects of ration size on fecundity are not mediated by orthologues of the {F}ec gene}, ' ...  
'journal = {Reprod. Fert. Dev.}, ' ...
'volume = {22}, ' ...
'pages = {1015-1021}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BeauGous2015'; type = 'Article'; bib = [ ...
'doi = {10.1371/journal.pone.0125841}, ' ...
'author = {Beaudouin, R. and Goussen, B. and Piccini, B. and Augustine, S. and Devillers, J. and Brion, F. and P\`{e}ry, A. R. R.}, ' ...
'year  = {2015}, ' ...
'title = {An Individual-Based Model of Zebrafish Population Dynamics Accounting for Energy Dynamics}, ' ...  
'journal = {PloS one}, ' ...
'volume = {10}, ' ...
'number = {5}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DrewRodn2008'; type = 'Article'; bib = [ ...  
'author = {Drew, Robert E. and Rodnick, Kenneth J. and Settles, Matthew and Wacyk, Jurij and Churchill, Erin and Powell, Madison S. and Hardy, Ronald W. and Murdoch, Gordon K. and Hill, Rodney A. and Robison, Barrie D.}, ' ...
'year = {2008}, ' ...
'title = {Effect of starvation on transcriptomes of brain and liver in adult female zebrafish (\emph{Danio rerio})}, ' ... 
'journal = {Physiological Genomics}, ' ...
'volume = {35}, '...
'pages = {283-295}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GeffSimo2013'; type = 'Article'; bib = [ ...  
'author = {Benjamin Geffroy and Olivier Simon}, ' ...
'year = {2013}, ' ...
'title = {Effects of a \emph{Spirulina platensis}-based diet on zebrafish female reproductive performance and larval survival rate}, ' ... 
'journal = {Cybium}, ' ...
'volume = {37}, '...
'pages = {31-38}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Baye2005'; type = 'Misc'; bib = [ ...
'author = {Bayer, A.G.}, ' ... 
'year = {2005}, ' ...
'note = {Control data from OECD tests, report number M-247419-01-1 F0 generation rep. 1 day 0}}, ' ...
'howpublished = {\url{https://cropscience-transparency.bayer.com/en/Study-Results}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


