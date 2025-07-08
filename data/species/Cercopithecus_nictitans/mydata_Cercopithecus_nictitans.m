function [data, auxData, metaData, txtData, weights] = mydata_Cercopithecus_nictitans
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Primates'; 
metaData.family     = 'Cercopithecidae';
metaData.species    = 'Cercopithecus_nictitans'; 
metaData.species_en = 'Greater spot-nosed monkey'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.3); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 12 28];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 15];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 14];

%% set data
% zero-variate data

data.tg = 172;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.3);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 365;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'guess';   
  temp.tx = C2K(37.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 1460;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
   temp.tp = C2K(37.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 31*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 406;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 4800;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'GautGaut1976';
  comment.Wwi = 'in captivity; in nature 4216 g';
data.Wwim = 10000;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'GautGaut1976';
  comment.Wwim = 'in captivity; in nature 6600 g';

data.Ri  = 0.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(37.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-weight
data.tWw_f = [ ... % time since 1967/01/01 (yr), wet weight (g)
0.303	1699.346
0.330	1830.065
0.494	1830.065
0.617	2026.144
0.836	2124.183
0.986	2336.601
1.123	2369.281
1.533	2434.641
1.997	2483.660
2.408	2875.817
2.558	3022.876
3.309	3218.954
4.062	4166.667
4.622	4575.163
5.251	4820.261
5.414	4477.124
5.470	5032.680
5.634	5147.059
6.508	5343.137
6.740	5408.497
7.054	5179.739
7.109	5261.438
7.217	4542.484
7.285	4509.804
7.381	4869.281
7.696	5032.680
8.064	4852.941
8.365	5065.359
8.583	4885.621
8.761	5065.359];
data.tWw_f(:,1) = (data.tWw_f(:,1) - data.tWw_f(1,1) + 2) * 365; % convert yr to d
data.tWw_f = [[0 406]; data.tWw_f];
units.tWw_f  = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f   = C2K(37.3);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'GautGaut1976';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since 1967/01/01 (yr), wet weight (g)
1.561	2908.497
1.971	3251.634
2.422	3529.412
2.559	3725.490
3.283	3937.908
4.640	7352.941
5.613	9640.523
7.799	10473.856
8.741	10473.856];
data.tWw_m(:,1) = (data.tWw_m(:,1) - data.tWw_m(1,1) + 3) * 365; % convert yr to d
data.tWw_m = [[0 406]; data.tWw_m];
units.tWw_m  = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m   = C2K(37.3);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'GautGaut1976';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw_f = 3 * weights.tWw_f;
weights.tWw_m = 3 * weights.tWw_m;
weights.Wwi = 3 * weights.Wwi;
weights.Wwim = 3 * weights.Wwim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

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
D1 = 'males are assumed to differ from females by {p_Am} after puberty only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = 'STFM'; % Cat of Life
metaData.links.id_ITIS = '573008'; % ITIS
metaData.links.id_EoL = '981572'; % Ency of Life
metaData.links.id_Wiki = 'Cercopithecus_nictitans'; % Wikipedia
metaData.links.id_ADW = 'Cercopithecus_nictitans'; % ADW
metaData.links.id_Taxo = '66025'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12100484'; % MSW3
metaData.links.id_AnAge = 'Cercopithecus_nictitans'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cercopithecus_nictitans}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Cercopithecus_nictitans}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GautGaut1976'; type = 'Article'; bib = [ ... 
'doi = {10.1159/000155749}, ' ...
'author = {Gautier-Hion, A. and Gautier, J.-P.}, ' ... 
'year = {1976}, ' ...
'title = {Croissance, maturité sexuelle et sociale, reproduction chez les cercopith\''{e}cin\''{e}s forestiers africains}, ' ...
'journal = {Folia Primatologica}, ' ...
'volume = {26(3)}, ' ...
'pages = {165–184}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Cercopithecus_nictitans/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

