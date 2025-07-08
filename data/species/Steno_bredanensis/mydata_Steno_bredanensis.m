function [data, auxData, metaData, txtData, weights] = mydata_Steno_bredanensis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Delphinidae';
metaData.species    = 'Steno_bredanensis'; 
metaData.species_en = 'Rough-toothed dolphin'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvf', 'xiCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37); % K, body temp
metaData.data_0     = {'ax'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 07 18];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 13];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 13];

%% set data
% zero-variate data

data.tx = 150;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'guess';   
  temp.tx = C2K(37);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 9.5*365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'West2002';   
  temp.tp = C2K(37);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 11*365;     units.tpm = 'd';    label.tpm = 'time since birth at puberty'; bibkey.tpm = 'West2002';   
  temp.tpm = C2K(37);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
  comment.tpm = 'between 5 and 14 yr';
data.am = 32*365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'AnAge';   
  temp.am = C2K(37);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 100; units.Lb = 'cm';   label.Lb = 'length at birth'; bibkey.Lb = 'guess';
data.Lp = 214.5; units.Lp = 'cm';   label.Lp = 'length at puberty for females'; bibkey.Lp = 'West2002';
data.Lpm = 229; units.Lpm = 'cm';   label.Lpm = 'length at puberty for males'; bibkey.Lpm = 'West2002';
data.Li = 247; units.Li = 'cm'; label.Li = 'ultimate length for females'; bibkey.Li = 'SiciRamo2007';
data.Lim = 253; units.Lim = 'cm'; label.Lim = 'ultimate length for females'; bibkey.Lim = 'SiciRamo2007';

data.Ri  = 0.2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(37);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-length
data.tL = [ % time since birth (yr), length (cm)
0.433	177.802
0.434	172.737
0.435	169.515
1.864	210.469
1.901	193.433
2.916	260.637
5.959	250.921
10.060	244.413
12.961	267.849
15.014	248.941
19.047	239.671
20.889	262.663
20.924	257.137
20.925	250.231
23.004	283.349]; 
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL  = C2K(37);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SiciRamo2007';

% time-length data
data.tL_f = [ % time since birth (yr), length (cm)
0.954	125.533
2.040	181.762
2.042	186.490
3.104	183.619
3.895	202.019
4.010	209.901
4.125	216.995
5.015	203.878
6.136	208.363
9.050	216.031
10.058	217.887
10.117	226.293
11.008	215.540
11.063	212.914
12.914	221.089
18.066	228.797]; 
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'length', 'female'};  
temp.tL_f  = C2K(37);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'West2002';
comment.tL_f = 'Data for females';
% 
data.tL_m = [ ... % time since birth (yr), length (cm)
0.970	167.034
0.973	172.813
1.036	191.988
1.481	184.641
2.380	193.062
3.058	209.359
4.970	232.507
5.018	210.182
5.076	215.961
5.967	205.996
7.984	210.759
11.071	230.775
12.022	229.741
13.143	235.277
13.924	228.461
14.037	231.615
15.268	230.586]; 
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'length', 'male'};  
temp.tL_m  = C2K(37);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'West2002';
comment.tL_m = 'Data for males';

% length-weight
data.LW = [ ...  % weight (kg), length (cm), 
8.517	93.311
21.799	126.381
33.899	157.549
53.999	184.559
56.349	182.286
61.562	193.311
63.431	187.239
70.307	203.205
76.438	204.738
79.281	210.821
80.929	210.066
83.040	206.653
83.289	211.590
85.641	210.077
90.594	211.607
92.493	216.928
95.793	217.316
100.962	211.632
101.212	216.949
102.625	216.573
107.815	218.863
110.160	214.692
111.378	229.885
111.599	224.189
112.784	226.850
119.624	229.145
121.961	221.935
130.940	231.450
133.771	232.596
134.483	234.496
137.059	228.427
144.136	231.481
149.548	228.456];
data.LW = data.LW(:,[2 1]); % set sequence to standard
units.LW  = {'cm', 'kg'};  label.LW = {'length', 'weight'};  
bibkey.LW = 'West2002';
comment.LW = 'Sexes combined, no difference found';

%% set weights for all real data
weights = setweights(data, []);
weights.tp = 0 * weights.tp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; units.psd.k = '-'; label.psd.k = 'maintenance ratio';
weights.psd.k = 5 * weights.psd.k_J; weights.psd.k_J = 0;
%weights.psd.p_M = 2 * weights.psd.p_M;

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '4ZVS4'; % Cat of Life
metaData.links.id_ITIS = '180417'; % ITIS
metaData.links.id_EoL = '46559291'; % Ency of Life
metaData.links.id_Wiki = 'Steno_bredanensis'; % Wikipedia
metaData.links.id_ADW = 'Steno_bredanensis'; % ADW
metaData.links.id_Taxo = '68703'; % Taxonomicon
metaData.links.id_WoRMS = '137110'; % WoRMS
metaData.links.id_MSW3 = '14300096'; % MSW3
metaData.links.id_AnAge = 'Steno_bredanensis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Steno_bredanensis}}';
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
bibkey = 'SiciRamo2007'; type = 'article'; bib = [ ... 
'author = {S. Siciliano and R. M. A. Ramo and A. P. M. Di Beneditto and M. C. O. Santos and A. B. Fragoso and J. L. Brito and A. F. Azevedo and A. F. C. Vicente and E. Zampirolli and F. S. Alvarenga and L. Barbosa and N. R. W. Lima}, ' ... 
'year = {2007}, ' ...
'title = {Age and growth of some delphinids in south-eastern {B}razil}, ' ...
'journal = {J. Mar. Biol. Ass. U.K.}, ' ...
'doi = {10.1017/S0025315407053398}, ' ...
'volume = {87}, ' ...
'pages = {293--303}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'West2002'; type = 'phdthesis'; bib = [ ... 
'author = {K, L. West}, ' ... 
'year = {2002}, ' ...
'title = {Ecology and biology of the rough-toothed dolphin (\emph{Steno bredanensis})}, ' ...
'school = {Univ. of Hawaii}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Steno_bredanensis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

