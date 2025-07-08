function [data, auxData, metaData, txtData, weights] = mydata_Macaca_sylvanus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Primates'; 
metaData.family     = 'Cercopithecidae';
metaData.species    = 'Macaca_sylvanus'; 
metaData.species_en = 'Barbary macaque'; 

metaData.ecoCode.climate = {'Am', 'Cfa'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf','0iTg','0iTd'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.3); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 12 29];              
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

data.tg = 164;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.3);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 213;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 1399;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
   temp.tp = C2K(37.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 2007;   units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(37.3);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 30*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 55.7;    units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Wiki';
  comment.Li = '48.5–58.5 cm';
data.Lim  = 63.4;    units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';   bibkey.Lim  = 'Wiki';
  comment.Lim = '51.7–65 cm';
  
data.Wwb = 680;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Robe1978';
data.Wwi = 10500;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'Wiki';
  comment.Wwi = '9.9–11 kg';
data.Wwim = 15250;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'Wiki';
  comment.Wwim = '14.5–16 kg';

data.Ri  = 1.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-weight
data.tWw_f = [ ... % time since birth (d), wet weight (g)
0.000	717.542
381.464	2012.697
746.508	5639.969
1118.763	6935.302
1574.183	8453.709
1849.958	9212.252
2161.422	11091.381
2244.618	11359.296
2516.023	12117.899
2612.474	12609.848
2919.363	14175.139
3019.919	14263.443
3278.010	14708.328];
units.tWw_f  = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f   = C2K(37.3);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'Robe1978';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (d), wet weight (g)
0.000	627.798
351.113	2371.859
729.706	6671.588
1114.452	7025.048
1487.412	9396.605
1868.611	11005.718
2193.066	12705.296
2574.530	14717.993
2917.022	17269.341
3271.652	18340.702];
units.tWw_m  = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m   = C2K(37.3);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'Robe1978';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw_f = 3 * weights.tWw_f;
weights.tWw_m = 3 * weights.tWw_m;

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
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '3WWP8'; % Cat of Life
metaData.links.id_ITIS = '573027'; % ITIS
metaData.links.id_EoL = '323959'; % Ency of Life
metaData.links.id_Wiki = 'Macaca_sylvanus'; % Wikipedia
metaData.links.id_ADW = 'Macaca_sylvanus'; % ADW
metaData.links.id_Taxo = '168602'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12100565'; % MSW3
metaData.links.id_AnAge = 'Macaca_sylvanus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Macaca_sylvanus}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Macaca_sylvanus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Robe1978'; type = 'Article'; bib = [ ... 
'doi = {10.1159/000155842}, ' ...
'author = {Roberts, M. S.}, ' ... 
'year = {1978}, ' ...
'title = {The Annual Reproductive Cycle of Captive \emph{Macaca sylvana}}, ' ...
'journal = {Folia Primatologica}, ' ...
'volume = {29(3)}, ' ...
'pages = {229–235}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Macaca_sylvanus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

