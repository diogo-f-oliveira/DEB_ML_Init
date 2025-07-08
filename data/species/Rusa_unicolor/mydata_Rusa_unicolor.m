function [data, auxData, metaData, txtData, weights] = mydata_Rusa_unicolor

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Cervidae';
metaData.species    = 'Rusa_unicolor'; 
metaData.species_en = 'Sambar deer'; 

metaData.ecoCode.climate = {'Am','Cwa'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf', '0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.6); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 07 21];              
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

data.tg = 232;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg =  'AnAge';   
  temp.tg = C2K(38.6);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 213;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 650;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';   
  temp.tp = C2K(38.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 26.4*365;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'AnAge';   
  temp.am = C2K(38.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 7500;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'DahlDawe2013';
data.Wwi = 100e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight females'; bibkey.Wwi = 'DahlDawe2013';
data.Wwim = 170e3;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight males'; bibkey.Wwim = 'DahlDawe2013';
  comment.Wwim = 'Wiki: till 546 kg';  

data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';         bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-weight
data.tWw_f = [ ... % time  since birth (d),  weight (g)
0.000	8288.285
141.491	17968.545
313.302	27279.905
454.793	28673.594
601.337	54209.700
783.255	71805.943
1409.858	81324.147
1733.266	84097.852
2036.462	91563.068
2359.870	87850.295
2678.225	96751.830
3006.687	99163.475
3314.935	96176.537
3638.343	101833.122
3951.645	120466.102
4259.894	114956.639
4446.864	109848.479]; 
units.tWw_f  = {'d', 'g'};  label.tWw_f = {'time', 'weight', 'female'};  
temp.tWw_f  = C2K(38.6);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'DahlDawe2013';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time  since birth (d),  weight (g)
0.000	6846.832
151.598	12199.356
318.355	33043.960
464.899	47048.545
621.550	66455.125
778.201	75771.619
1414.911	97538.658
2683.278	137110.491
3006.687	153577.888
3633.290	164897.895
3971.858	166945.765
4441.811	137958.287]; 
units.tWw_m  = {'d', 'g'};  label.tWw_m = {'time', 'weight', 'male'};  
temp.tWw_m  = C2K(38.6);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'DahlDawe2013';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw_f = 2 * weights.tWw_f;
weights.tWw_m = 2 * weights.tWw_m;
weights.Wwb = 5 * weights.Wwb;
weights.tg = 5 * weights.tg;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

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
D1 = 'Slow foetal development is assumend';
D2 = 'Males are assumend to differ from females by {p_Am} only';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '4TQSL'; % Cat of Life
metaData.links.id_ITIS = '898215'; % ITIS
metaData.links.id_EoL = '290025'; % Ency of Life
metaData.links.id_Wiki = 'Rusa_unicolor'; % Wikipedia
metaData.links.id_ADW = 'Rusa_unicolor'; % ADW
metaData.links.id_Taxo = '167663'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14200453'; % MSW3
metaData.links.id_AnAge = 'Rusa_unicolor'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rusa_unicolor}}';
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
bibkey = 'DahlDawe2013'; type = 'Article'; bib = [ ... 
'author = {Ismail Dahlan and Jiwan Dawend}, ' ... 
'year = {2013}, ' ...
'title = {Growth and reproductive performance of sambar deer in {S}abal {F}orest {R}eserve of Sarawak, {M}alaysia}, ' ...
'journal = {Trop Anim Health Prod}, ' ...
'volume = {45}, ' ...
'pages = {1469–1476}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Rusa_unicolor}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

