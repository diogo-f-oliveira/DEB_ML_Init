function [data, auxData, metaData, txtData, weights] = mydata_Neotrygon_picta
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Myliobatiformes'; 
metaData.family     = 'Dasyatidae';
metaData.species    = 'Neotrygon_picta'; 
metaData.species_en = 'Peppered maskray'; 

metaData.ecoCode.climate = {'MA','MB'};
metaData.ecoCode.ecozone = {'MASE','MIW'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 30];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 01];

%% set data
% zero-variate data;
data.ab = 10*30.5; units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(27.7);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 18*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'JacoBenn2010';   
  temp.am = C2K(27.7); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 10; units.Lb  = 'cm';  label.Lb  = 'disc width at birth';   bibkey.Lb  = 'JacoBenn2010';
data.Lp  = 18; units.Lp  = 'cm';  label.Lp  = 'disc width at puberty'; bibkey.Lp  = 'JacoBenn2010';
data.Lpm  = 17; units.Lpm  = 'cm';  label.Lpm  = 'disc width at puberty for males'; bibkey.Lpm  = 'JacoBenn2010';
data.Li  = 27.5;   units.Li  = 'cm';  label.Li  = 'ultimate disc width';   bibkey.Li  = 'fishbase';
data.Lim  = 24;   units.Lim  = 'cm';  label.Lim  = 'ultimate disc width for males';   bibkey.Lim  = 'fishbase';

data.Wwi = 668; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = {'JacoBenn2010','fishbase'};
 comment.Wwi = 'based on 1.8e-5*(10*Li)^3.103, see F1';
data.Wwim = 415; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = {'JacoBenn2010','fishbase'};
 comment.Wwim = 'based on 2.59e-5*(10*Lim)^3.027, see F1';

data.Ri  = 2.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(27.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Dasyatis_chrysonota: 1-5 pups per litter, assumed 1 litter per yr';
  
% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), disc width (cm)
0.020	11.165
0.030	11.391
0.032	9.887
0.068	12.293
0.490	13.797
0.530	12.519
0.530	12.218
0.760	13.722
1.069	12.895
1.451	15.752
1.484	19.962
1.491	14.173
1.721	15.526
2.490	16.729
2.530	15.301
3.026	18.985
3.028	17.707
3.061	21.767
3.564	20.489
3.570	15.752
4.106	18.459
4.528	19.962
4.529	19.436
4.984	24.699
5.029	19.962
5.102	23.045
5.104	21.165
5.528	21.541
5.568	20.038
6.026	23.872
6.030	20.940
6.494	19.737
6.952	22.895
6.953	21.842
6.988	24.774
7.070	21.090
7.452	23.647
7.534	19.436
7.643	25.000
7.994	21.541
8.069	22.895
8.528	25.827
8.986	29.060
8.993	24.173
10.070	25.526
10.535	23.271
18.077	32.218];
data.tL_f(:,1) = 365 * (0 + data.tL_f(:,1)); % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'disc width', 'female'};  
temp.tL_f = C2K(27.7); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'JacoBenn2010';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), disc width (cm)
0.031	11.165
0.259	13.496
0.262	10.789
0.570	11.466
0.645	13.045
0.950	15.075
1.063	17.105
1.070	11.992
1.100	18.459
1.106	13.647
1.107	13.271
1.564	17.707
1.565	17.030
1.567	15.000
1.568	14.399
1.569	13.797
1.952	15.226
1.990	15.827
1.991	14.624
2.025	18.459
2.030	14.323
2.064	17.857
2.065	17.105
2.105	16.429
2.488	17.707
2.489	17.030
2.525	19.135
2.602	19.511
2.606	16.128
2.607	15.827
2.993	15.226
3.029	17.105
3.032	14.850
3.063	20.188
3.064	19.812
3.066	17.857
3.142	18.985
3.145	16.429
3.491	17.256
3.492	16.805
3.529	17.932
3.644	18.459
3.988	20.564
4.030	17.782
4.066	19.436
4.067	18.534
4.069	16.955
4.070	16.429
4.102	21.241
4.489	20.113
4.531	17.256
4.569	18.083
4.607	18.759
5.029	19.812
5.030	18.985
5.031	18.083
5.032	17.556
5.064	22.744
5.065	21.767
5.105	20.639
5.530	19.511
5.571	18.083
6.030	20.263
6.032	19.361
6.033	18.534
6.106	21.617
6.495	18.383
6.570	20.188
6.605	22.669
6.606	21.842
6.646	21.316
7.030	22.218
7.031	21.617
7.032	20.865
7.033	20.188
7.112	18.684
7.956	20.865
8.529	25.075
8.574	20.414
9.067	26.203
10.074	22.669
10.994	26.053];
data.tL_m(:,1) = 365 * (0 + data.tL_m(:,1)); % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'disc width', 'male'};  
temp.tL_m = C2K(27.7); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'JacoBenn2010';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 10 * weights.tL_f;
weights.tL_m = 10 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 3 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'length-weight: Ww in g =  1.8e-5*(DW in mm)^3.103 for females, 2.59e-5*(DW in mm)^3.027 for males';
metaData.bibkey.F1 = 'JacoBenn2010';
F2 = 'ovoviviparous';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '46W36'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46560962'; % Ency of Life
metaData.links.id_Wiki = 'Neotrygon_picta'; % Wikipedia
metaData.links.id_ADW = 'Neotrygon_picta'; % ADW
metaData.links.id_Taxo = '1684037'; % Taxonomicon
metaData.links.id_WoRMS = '398332'; % WoRMS
metaData.links.id_fishbase = 'Neotrygon-picta'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Neotrygon_picta}}'; 
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
bibkey = 'JacoBenn2010'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.2010.02829.x}, ' ...
'author = {I. P. Jacobsen and M. B. Bennett}, ' ...
'year = {2010}, ' ...
'title  = {Age and growth of \emph{Neotrygon picta}, \emph{Neotrygon annotata} and \emph{Neotrygon kuhlii} from north-east {A}ustralia, with notes on their reproductive biology}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {77}, ' ...
'pages = {2405-2422}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Neotrygon-picta.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

