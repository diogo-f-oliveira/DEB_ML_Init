function [data, auxData, metaData, txtData, weights] = mydata_Lophocebus_albigena
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Primates'; 
metaData.family     = 'Cercopithecidae';
metaData.species    = 'Lophocebus_albigena'; 
metaData.species_en = 'Grey-cheeked mangabey'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHs', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.3); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am';  'Wwb'; 'Wwi'; 'Ri'}; 
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

data.tg = 181;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.3);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 233;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 1460;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
   temp.tp = C2K(37.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 36*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 425;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 6975;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'GautGaut1976';
  comment.Wwi = 'in captivity; in nature 6401 g';
data.Wwim = 9250;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'GautGaut1976';
  comment.Wwim = 'in captivity; in nature 8980 g';

data.Ri  = 0.4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-weight
data.tWw_f = [ ... % time since 1966/01/01 (yr), wet weight (g)
1.522	1550.835
2.033	1893.120
2.174	1959.085
2.337	1894.117
3.326	2735.784
4.576	4560.839
4.859	4823.773
5.109	5335.509
5.359	5703.140
5.663	6149.551
5.750	6149.836
6.783	6493.830
7.098	6717.569
7.598	7505.233
7.685	8383.247
7.815	8894.591
8.000	8122.271
8.065	8960.912
8.598	7809.818];
data.tWw_f(:,1) = (data.tWw_f(:,1) - data.tWw_f(1,1) + 0.5) * 365; % convert yr to d
data.tWw_f = [[0 425]; data.tWw_f];
units.tWw_f  = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f   = C2K(37.3);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'GautGaut1976';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since 1966/01/01 (yr), wet weight (g)
0.249	1279.918
0.358	1376.966
0.467	1457.806
0.590	1571.037
0.918	1910.804
1.095	1975.314
1.300	2363.924
1.559	2509.324
1.995	2686.821
2.146	2864.832
2.310	3221.100
3.320	4110.691
4.563	5648.161
4.865	6376.953
5.084	6976.234
5.386	7802.271
5.945	7979.547
7.158	8658.074
7.568	9111.145
7.949	8899.763
8.112	8996.713
8.385	9223.126
8.779	8930.682
8.970	8849.302
9.052	9221.924];
data.tWw_m(:,1) = (data.tWw_m(:,1) - data.tWw_m(1,1) + 0.5) * 365; % convert yr to d
data.tWw_m = [[0 425]; data.tWw_m];
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
metaData.links.id_CoL = '3W2S8'; % Cat of Life
metaData.links.id_ITIS = '573016'; % ITIS
metaData.links.id_EoL = '128438'; % Ency of Life
metaData.links.id_Wiki = 'Lophocebus_albigena'; % Wikipedia
metaData.links.id_ADW = 'Lophocebus_albigena'; % ADW
metaData.links.id_Taxo = '168561'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12100522'; % MSW3
metaData.links.id_AnAge = 'Lophocebus_albigena'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lophocebus_albigena}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Lophocebus_albigena}}';
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
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Lophocebus_albigena/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

