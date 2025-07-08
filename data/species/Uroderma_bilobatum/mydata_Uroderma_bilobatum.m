function [data, auxData, metaData, txtData, weights] = mydata_Uroderma_bilobatum

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Phyllostomidae';
metaData.species    = 'Uroderma_bilobatum'; 
metaData.species_en = 'Tent-making bat'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTh','0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM','xiHs','xiHn'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(34.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011


metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 06 28];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 12];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 12];

%% set data
% zero-variate data

data.tg = 4.5*30.5;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'ADW';   
  temp.tg = C2K(34.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature'; 
data.tx = 35;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'KohlPage2018';   
  temp.tx = C2K(34.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '25-40 d';
data.tp = 2*365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(34.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 20*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'guess';   
  temp.am = C2K(34.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';         bibkey.Wwb = 'guess';
  comment.Wwb = 'based on extrapolation in tWw data';
data.Wwi = 17.3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'KohlPage2018';
data.Wwim = 16.5;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for male'; bibkey.Wwim = 'KohlPage2018';

data.Ri  = 2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(34.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 pup per litter; 2 litters per yr';

% uni-variate data
% time-weight
data.tWw_f = [ ... % time since birth (d), wet weight (g)
34.023	12.500
34.027	13.246
38.003	12.020
38.015	14.039
38.329	11.011
48.803	13.957
49.885	14.484
50.033	11.478
50.049	14.089
51.047	14.485
52.050	15.604
52.070	19.006
52.129	15.034
56.936	13.961
56.939	14.510
57.179	12.996
60.016	15.521
60.244	12.010
60.256	14.073
71.145	17.041];
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time since start birthing season', 'wet weight', 'female'};  
temp.tWw_f    = C2K(34.8);  units.temp.tWw_f = 'C'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'KohlPage2018';
comment.tWw_f = 'Data for females; time since birth may be overestimeted by 15-30 d';
%
data.tWw_m = [ ... % time since birth (d), wet weight (g)
26.943	8.108
27.019	6.945
27.132	11.970
34.153	6.488
36.984	8.069
37.007	11.997
38.024	15.531
38.241	10.023
48.952	11.016
49.124	12.026
50.019	9.020
50.280	11.083
50.372	12.597
57.257	12.074
58.196	16.595
70.893	16.514
70.994	19.521
71.222	16.032];
units.tWw_m   = {'d', 'g'};  label.tWw_m = {'time since start birthing season', 'wet weight', 'male'};  
temp.tWw_m    = C2K(34.8);  units.temp.tWw_m = 'C'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'KohlPage2018';
comment.tWw_m = 'Data for males; time since birth may be overestimeted by 15-30 d';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw_f = 3 * weights.tWw_f;
weights.tWw_m = 3 * weights.tWw_m;
weights.Wwb = 10 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0; units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development'; 
weights.psd.t_0 = 0.1;

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
D1 = 'Body temperature is guessed';
D2 = 'Males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '7DSWT'; % Cat of Life
metaData.links.id_ITIS = '631868'; % ITIS
metaData.links.id_EoL = '289573'; % Ency of Life
metaData.links.id_Wiki = 'Uroderma_bilobatum'; % Wikipedia
metaData.links.id_ADW = 'Uroderma_bilobatum'; % ADW
metaData.links.id_Taxo = '64494'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13801451'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Uroderma_bilobatum}}';
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
bibkey = 'KohlPage2018'; type = 'Article'; bib = [ ...
'doi = {10.1371/journal.pone.0205351}, ' ...
'author = {Kohles, J. E. and Page, R. A. and Dechmann, D. K. N. and OMara,  M. T.}, ' ... 
'year = {2018}, ' ...
'title =  {Rapid behavioral changes during early development in Peters'' tent-making bat (\emph{Uroderma bilobatum})}, ' ...
'journal = {PLoS ONE}, ' ...
'volume = {13(10)}, ' ...
'pages = {e0205351}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Uroderma_bilobatum/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

