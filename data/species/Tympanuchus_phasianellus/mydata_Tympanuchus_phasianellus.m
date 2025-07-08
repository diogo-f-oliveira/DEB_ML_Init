function [data, auxData, metaData, txtData, weights] = mydata_Tympanuchus_phasianellus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Galliformes'; 
metaData.family     = 'Phasianidae';
metaData.species    = 'Tympanuchus_phasianellus'; 
metaData.species_en = 'Sharp-tailed grouse'; 

metaData.ecoCode.climate = {'BSk','Dfb','Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.7); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 10 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 22];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 22];

%% set data
% zero-variate data

data.ab = 23.5;        units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'avibase';   
  temp.ab = C2K(40.7);   units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '21-24 d';
data.tx = 9;          units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';   
  temp.tx = C2K(40.7); units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '7-10 d';
data.tp = 100;          units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.7); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'close to adult size.';
data.tR = 365;         units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'avibase';
  temp.tR = C2K(40.7); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 7.5*365;     units.am = 'd';    label.am = 'life span';                  bibkey.am = 'AnAge';   
  temp.am = C2K(40.7); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Ww0 = 24;   units.Ww0 = 'g';  label.Ww0 = ' intitial wet weight';         bibkey.Ww0 = 'avibase';
data.Wwb = 12.5;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';            bibkey.Wwb = 'avibase';
data.Wwi = 817;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';          bibkey.Wwi = 'avibase';
data.Wwim = 953; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight of male'; bibkey.Wwim = 'avibase';

data.Ri  = 12/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';       bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(40.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '5-17 eggs per clutch, 1 clutch per yr';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
2.389	15.355
10.061	37.673
11.423	36.016
17.229	75.261
24.230	123.036
30.557	184.378
33.281	184.462
37.053	244.027
39.108	271.266
40.831	318.878
52.635	446.631
53.298	404.188
72.591	527.077
72.785	581.436
77.043	583.266
82.552	724.413
100.956	758.951
103.132	670.696];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.7);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'McEwKnap1969';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;
weights.ab= 5 * weights.ab;
 weights.Wwi = 3 * weights.Wwi;
weights.Ww0 = 0 * weights.Ww0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 2;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Body temperature is guessed';
D2 = 'Males are assumed to differ from females by {p_Am} only';
D3 = 'Ww0 data is ignorned due to inconsistency with Wwb and tW data';
D4 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = '7DB5J'; % Cat of Life
metaData.links.id_ITIS = '175841'; % ITIS
metaData.links.id_EoL = '45510631'; % Ency of Life
metaData.links.id_Wiki = 'Tympanuchus_phasianellus'; % Wikipedia
metaData.links.id_ADW = 'Tympanuchus_phasianellus'; % ADW
metaData.links.id_Taxo = '52979'; % Taxonomicon, server down
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '861CBBDA948F5C13'; % avibase
metaData.links.id_birdlife = 'sharp-tailed-grouse-tympanuchus-phasianellus'; % birdlife
metaData.links.id_AnAge = 'Tympanuchus_phasianellus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Tympanuchus_phasianellus}}';
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
bibkey = 'McEwKnap1969'; type = 'Article'; bib = [ ... 
'doi = {10.2307/3799827}, ' ...
'author = {McEwen, L. C. and Knapp, D. B. and Hilliard, E. A.}, ' ... 
'year = {1969}, ' ...
'title = {Propagation of Prairie Grouse in Captivity}, ' ...
'journal = {The Journal of Wildlife Management}, ' ...
'volume = {33(2)}, ' ...
'pages = {276-283}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=861CBBDA948F5C13&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\urlhttps://genomics.senescence.info/species/entry.php?species=Tympanuchus_phasianellus}}';
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

