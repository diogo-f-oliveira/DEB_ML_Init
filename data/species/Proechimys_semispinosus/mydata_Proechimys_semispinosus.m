function [data, auxData, metaData, txtData, weights] = mydata_Proechimys_semispinosus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Echimyidae';
metaData.species    = 'Proechimys_semispinosus'; 
metaData.species_en = 'Tome''s spiny rat'; 

metaData.ecoCode.climate = {'Aw','Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM','xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.9); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L','t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 03];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 11 03]; 
metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 14];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 14];

%% set data
% zero-variate data

data.tg = 64.5;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'MaliEise1971';   
  temp.tg = C2K(37.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '63-66 d';
data.tx = 21;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.9);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 146;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'AnAge';
  temp.tp = C2K(37.9);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 5.5*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
    
data.Wwb = 23;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 500;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 4.68*2.4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4.68 litter per yr, 2.4 pups per litter';

% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), head+body length (cm)
0.637	12.931
8.263	15.212
8.457	16.676
19.971	22.156
28.479	24.086
28.526	21.295
42.284	23.489
42.466	25.721
54.046	27.224
54.065	26.107
54.742	24.919
59.075	27.698
60.423	25.671
60.822	27.972
84.398	32.371
84.852	31.393
85.074	31.184
85.300	30.764
95.568	32.201
109.136	32.721
125.550	33.303];
units.tL  = {'d', 'cm'};  label.tL = {'time', 'head+body length'};  
temp.tL  = C2K(37.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MaliEise1971';

% time-weight
data.tWw_f = [ ... % time since birth (mnth), weight (g)
0.183	25.218
6.771	35.421
15.373	49.200
21.229	61.987
28.915	79.895
34.588	96.288
42.092	112.655
49.412	131.083
55.817	136.657
62.954	149.941
70.092	158.592
76.863	170.852
83.817	180.021
90.771	188.675
98.092	198.354
104.314	208.562
111.634	217.726];
units.tWw_f = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f  = C2K(37.9);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'Tesh1970';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (mnth), weight (g)
0.366	24.186
6.954	40.566
14.092	52.820
21.412	72.278
28.183	89.170
34.771	109.153
42.092	129.640
49.046	147.044
56.366	163.414
62.954	174.132
70.092	186.901
76.680	209.972
84.183	225.825
90.954	235.511
97.725	250.344
104.131	265.697
111.268	273.319];
units.tWw_m = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m  = C2K(37.9);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'Tesh1970';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
%weights.psd.t_0 = 3;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tWw_f','tWw_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '4MQLJ'; % Cat of Life
metaData.links.id_ITIS = '584853 '; % ITIS
metaData.links.id_EoL = '326996'; % Ency of Life
metaData.links.id_Wiki = 'Proechimys_semispinosus'; % Wikipedia
metaData.links.id_ADW = 'Proechimys_semispinosus'; % ADW
metaData.links.id_Taxo = '63594'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13400504'; % MSW3
metaData.links.id_AnAge = 'Proechimys_semispinosus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Proechimys_semispinosus}}';
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
bibkey = 'MaliEise1971'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1748-1090.197}, ' ...
'author = {Maliniak, E. and Eisenberg, J. F.}, ' ... 
'year = {1971}, ' ...
'title = {Breeding spiny rats in captivity}, ' ...
'journal = {International Zoo Yearbook}, ' ...
'volume = {11(1)}, ' ...
'pages = {93–98}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Tesh1970'; type = 'Article'; bib = [ ... 
'author = {Robert B. Tesh}, ' ... 
'year = {1970}, ' ...
'title = {Notes on the Reproduction, Growth, and Development of {E}chimyid Rodents in {P}anama}, ' ...
'journal = {Journal of Mammalogy}, ' ...
'volume = {51(1)}, ' ...
'pages = {199-202}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Proechimys_semispinosus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Proechimys_semispinosus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
