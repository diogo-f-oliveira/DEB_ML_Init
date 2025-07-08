function [data, auxData, metaData, txtData, weights] = mydata_Buccinanops_deformis

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Neogastropoda'; 
metaData.family     = 'Nassariidae';
metaData.species    = 'Buccinanops_deformis'; 
metaData.species_en = 'Collared buccinum'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCim'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 12 31];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 12 31]; 

%% set data
% zero-variate data

data.am = 20*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.5;    units.Lb  = 'cm';  label.Lb  = 'shell length at birth'; bibkey.Lb  = 'Narv2006';
data.Lp  = 3.5;    units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'Narv2006';
data.Li  = 6.54;   units.Li  = 'cm';  label.Li  = 'ultimate shell length'; bibkey.Li  = 'Narv2006';
data.Lim  = 4.86;   units.Lim  = 'cm';  label.Lim  = 'ultimate shell length for males'; bibkey.Lim  = 'Narv2006';

data.Wwp = 5.27;  units.Wwp = 'g'; label.Wwp = 'ultimate flesh weight'; bibkey.Wwp = 'Narv2006';
  comment.Wwp = 'Based on 0.0003*(10*Lp)^2.87, see F1, and assumed fraction 0.35 taken by shell';
data.Wwi = 31.65;  units.Wwi = 'g'; label.Wwi = 'ultimate flesh weight'; bibkey.Wwi = 'Narv2006';
  comment.Wwi = 'Based on 0.0003*(10*Li)^2.87, see F1, and assumed fraction 0.35 taken by shell';

data.Ri  = 400/365; units.Ri  = '#/d'; label.Ri = 'max reproduction rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '5 to 66 eggs capsules, on average 100 eggs per capsule assumed';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), shell height (cm)
0.009	0.508
0.018	0.787
0.018	0.754
0.018	0.705
0.978	1.131
0.987	1.393
0.987	1.262
0.997	1.607
0.997	1.508
1.006	2.049
1.015	2.000
1.015	1.852
1.062	3.311
1.976	1.934
1.984	2.836
2.031	3.902
2.980	5.148
2.980	5.000
2.981	3.918
2.982	3.623
2.983	2.967
2.989	5.475
3.987	5.803
3.987	5.672
3.988	5.525
3.989	4.410
3.998	5.115
3.998	4.869
3.998	4.754
4.007	5.393
4.009	4.246
4.009	4.049
4.027	4.607
4.969	4.361
4.969	4.180
4.978	4.967
4.978	4.852
4.978	4.672
4.979	4.000
4.979	3.623
4.996	5.656
4.996	5.492
4.997	5.131
5.976	5.459
5.976	5.361
5.986	5.197
5.986	5.082
6.974	5.951
6.974	5.885
6.984	5.738
6.984	5.639];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'shell length', 'female'};  
temp.tL_f    = C2K(18);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Narv2006';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), shell height (cm)
0.009	0.426
0.018	0.623
0.027	1.000
0.957	2.475
0.985	2.836
0.986	2.689
0.986	2.311
0.986	2.115
0.986	1.984
0.987	1.902
0.987	1.754
0.987	1.574
1.022	3.951
1.966	2.377
1.975	2.492
1.992	4.426
1.992	4.213
1.993	3.721
2.002	3.607
2.003	2.918
2.012	3.426
2.013	3.115
3.000	4.443
3.001	4.016
3.002	3.115
3.020	3.623
3.021	3.377
3.021	3.230
3.030	3.574
3.981	3.197
3.988	5.295
3.988	5.098
3.988	4.984
3.999	4.197
4.000	3.869
4.000	3.689
4.000	3.557
4.000	3.344
4.008	4.738
4.018	4.623
4.979	4.246
4.979	4.016
4.979	3.852
5.006	5.328
5.006	5.131
5.966	5.623
5.977	4.738
5.996	4.934
5.996	4.607
5.996	4.393
5.997	4.246
5.997	4.066
6.015	5.066
6.015	5.066
6.015	5.049
6.015	4.918
6.994	5.131
6.994	5.049
7.004	4.934
7.015	4.295];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'shell length', 'male'};  
temp.tL_m    = C2K(18);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Narv2006';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 50 * weights.psd.p_M;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'temperatures are guessed';
D3 = 'mod_1: males equal to females upto b';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'length-weight: total wet weight in g = 0.0003(shell length in mm)^2.87';
metaData.bibkey.F1 = 'Narv2006'; 
F2 = 'Direct Development';
metaData.bibkey.F2 = 'Narv2006'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = 'NKYQ'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46461832'; % Ency of Life
metaData.links.id_Wiki = 'Buccinanops'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3944644'; % Taxonomicon
metaData.links.id_WoRMS = '1514657'; % WoRMS
metaData.links.id_molluscabase = '532464'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Buccinanops_globulosus}}';
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
bibkey = 'Narv2006'; type = 'Article'; bib = [ ... 
'author = {Maite Andrea Narvarte}, ' ... 
'year = {2006}, ' ...
'title = {Biology and fishery of the whelk \emph{Buccinanops globulosum} ({K}iener, 1834) in northern coastal waters of the {S}an Mat\''{i}as {G}ulf ({P}atagonia, {A}rgentina)}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {77}, ' ...
'pages = {131-137}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

