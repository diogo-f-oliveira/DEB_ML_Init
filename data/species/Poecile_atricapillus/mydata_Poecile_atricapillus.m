function [data, auxData, metaData, txtData, weights] = mydata_Poecile_atricapillus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Paridae';
metaData.species    = 'Poecile_atricapillus'; 
metaData.species_en = 'Black-capped chickadee'; 

metaData.ecoCode.climate = {'Dfa', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnwf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 't-JX'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2010 10 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 11 26];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2022 12 18];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.date_mod_3     = [2023 07 08];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 08];

%% set data
% zero-variate data

data.ab = 12.5;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Smit1991';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 14;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Wiki';   
  temp.tx = C2K(41.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'temp from Wiki';
data.tp = 42;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'temp from Wiki';
data.tR = 365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'Smit1991';
  temp.tR = C2K(41.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 12.4*365;   units.am = 'd';    label.am = 'life span';           bibkey.am = 'Smit1991';   
  temp.am = C2K(41.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = .9^3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Smit1991';
data.Wwi = 12.4; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'avibase';
data.Wwim = 13.5; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'avibase';

data.Ri  = 10/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Smit1991';   
  temp.Ri = C2K(41.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'AnAge: 1 clutch/yr';

% uni-variate data
% time-feeding rate
data.tJX = [ ... % time since birth (d), feeding rate (g/d) for female, male
       1 0.1055627246 0.4525488819;
       2 0.1438670505 0.7270538913;
       3 0.3164787408 0.9788878199;
       4 0.7575524603 1.419403051;
       5 1.131647025  1.69950602;
       6 1.682528864  1.898082986;
       7 2.114850051  2.687539084;
       8 2.591967989  3.154438457;
       9 2.162770797  3.43909222;
      10 2.950341996  3.396847898;
      11 2.677145895  3.517598847;
      12 3.166786161  4.595325802;
      13 3.549842691  4.636505457;
      14 3.041702505  4.112548748;
      15 3.750400521  4.391185685;
      16 3.725368943  4.46630215;
      17 3.326687821  3.699499633;
      18 3.548424546  3.370450484;
      19 2.92914983   3.202092842;
      20 2.803272099  3.533498064;
      21 2.882729925  1.523961879];
units.tJX  = {'d', 'g/d'};  label.tJX = {'time since birth', 'feeding rate'};  
temp.tJX   = C2K(41.6);  units.temp.tJX = 'K'; label.temp.tJX = 'temperature';
treat.tJX = {1, {'female','male'}}; units.treat.tJX = 'g/d'; label.treat.tJX = 'gender';
bibkey.tJX = 'Smit1991'; comment.tJX = 'Data for female, male';

% time-weight
data.tW = [ ... % time since birth (d), wet weight^1/3 (g^1/3)
      1 1.118688942; % col 2: weight^{1/3} in g^{1/3}
      3 1.488805553;
      5 1.754410643;
      7 1.903778262;
      9 2.064560231;
      11 2.168702885;
      13 2.223980091];
data.tW(:,2) = data.tW(:,2).^3; % convert weight^1/3 to weight
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Smit1991';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;
weights.tJX = weights.tJX * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only'; 
D2 = 'mod_2: v is reduced and food availability is taken variable in tW data';
D3 = 'mod_3: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Facts
F1 = 'This species is well known for its capacity to lower its body temperature during cold winter nights';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4KSBV'; % Cat of Life
metaData.links.id_ITIS = '554382'; % ITIS
metaData.links.id_EoL = '45511438'; % Ency of Life
metaData.links.id_Wiki = 'Poecile_atricapillus'; % Wikipedia
metaData.links.id_ADW = 'Poecile_atricapillus'; % ADW
metaData.links.id_Taxo = '537391'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'B1F0CC82E34E4541'; % avibase
metaData.links.id_birdlife = 'black-capped-chickadee-poecile-atricapillus'; % birdlife
metaData.links.id_AnAge = 'Poecile_atricapillus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Poecile_atricapillus}}';
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
bibkey = 'Smit1991'; type = 'Book'; bib = [ ... 
'author = {Smith, S. M.}, ' ... 
'year = {1991}, ' ...
'title = {The Black-Capped Chickadee. {B}ehavioral Ecology and Natural History.}, ' ...
'publisher = {Comstock Publishing Associates}, ' ...
'address = {Ithaca}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=B1F0CC82E34E4541&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinPres1991'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0300-9629(91)90122-S}, ' ...
'author = {R. Prinzinger and A.Pre{\ss}mar and E. Schleucher}, ' ... 
'year = {1991}, ' ...
'title = {Body temperature in birds}, ' ...
'journal = {Comp. Biochem. Physiol.}, ' ...
'volume = {99A(4)}, ' ...
'pages = {499-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

