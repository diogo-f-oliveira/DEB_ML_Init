function [data, auxData, metaData, txtData, weights] = mydata_Platalea_ajaja
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Pelecaniformes'; 
metaData.family     = 'Threskiornithidae';
metaData.species    = 'Platalea_ajaja'; 
metaData.species_en = 'Roseate spoonbill';

metaData.ecoCode.climate = {'A', 'Cfa', 'Cfb'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFm', '0iFe'};
metaData.ecoCode.embryo  = {'Tnpfm', 'Tnsfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf', 'biCva'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 10 21];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1  = {'Bas Kooijman'};    
metaData.date_mod_1    = [2022 11 22];              
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1 = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 02];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 02];

%% set data
% zero-variate data

data.ab = 22.5;   units.ab = 'd';    label.ab = 'age at birth';                    bibkey.ab = 'avibase';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '22-23 d';
data.tx = 39.5;     units.tx = 'd';    label.tx = 'time since birth at fledging';  bibkey.tx = 'avibase';   
  temp.tx = C2K(40.6);    units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '35-42 d';
data.tp = 118.5;     units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'guess';   
  temp.tp = C2K(40.6);    units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '35-42 d';
data.tR = 1095;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';   bibkey.tR = 'avibase';
  temp.tR = C2K(40.6);    units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 28*365;  units.am = 'd';    label.am = 'life span';                    bibkey.am = 'avibase';   
  temp.am = C2K(40.6);    units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 68;    units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';     bibkey.Ww0 = 'avibase';
data.Wwb = 50;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';               bibkey.Wwb = 'avibase';
data.Wwi = 1519.5;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'avibase';
data.Wwim = 1463; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'avibase';

data.Ri  = 3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';          bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(40.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-5 eggs per clutch, 1 clutch per yr';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), weight (g)
 0.909	  47.852
 1.900	  52.112
 3.162	  65.062
 3.983	 121.639
 4.798	 143.350
 6.069	 204.241
 7.071	 260.801
 8.984	 378.287
 9.986	 443.563
11.253	 478.304
12.166	 543.589
13.049	 460.693
14.170	 665.425
15.837	 913.685
15.838	 913.685
15.839	 913.685
18.274	 939.594
18.942	1131.296];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'WhitMitc1982';
 
%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: v is reduced';
D3 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '77NWD'; % Cat of Life
metaData.links.id_ITIS = '174941'; % ITIS
metaData.links.id_EoL = '45509056'; % Ency of Life
metaData.links.id_Wiki = 'Platalea_ajaja'; % Wikipedia
metaData.links.id_ADW = 'Ajaia_ajaja'; % ADW
metaData.links.id_Taxo = '169502'; % Taxonomicon
metaData.links.id_WoRMS = '422584'; % WoRMS
metaData.links.id_avibase = '70924157EB774F64'; % avibase
metaData.links.id_birdlife = 'roseate-spoonbill-platalea-ajaja'; % birdlife
metaData.links.id_AnAge = 'Platalea_ajaja'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Platalea_ajaja}}';
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
bibkey = 'WhitMitc1982'; type = 'Article'; bib = [ ... 
'author = {Donald H. White and Christine A. Mitchell and Eugene Cromartie}, ' ... 
'year = {1982}, ' ...
'title = {Nesting Ecology of Roseate Spoonbills at {N}ueces {B}ay, {T}exas}, ' ...
'journal = {The Auk}, ' ...
'volume = {99(2)}, ' ...
'pages = {275-284}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Platalea_ajaja}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=70924157EB774F64&sec=lifehistory}}';
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

