function [data, auxData, metaData, txtData, weights] = mydata_Phoeniconaias_minor

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Phoenicopteriformes'; 
metaData.family     = 'Phoenicopteridae';
metaData.species    = 'Phoeniconaias_minor'; 
metaData.species_en = 'Lesser flamingo'; 

metaData.ecoCode.climate = {'BSh', 'Cw'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iS'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biP'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.5); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Carlos MGL Teixeira'};    
metaData.date_subm = [2012 07 31];              
metaData.email    = {'carlos.teixeira@tecnico.ulisboa.pt'};            
metaData.address  = {'Lisbon University'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2015 09 28];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2016 11 24];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_3     = [2023 06 24];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 24];

%% set data
% zero-variate data

data.ab = 28;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'ARKive';   
  temp.ab = C2K(37.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temps from BechJoha1979';
data.tx = 77.5;  units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'BrowKing2005';   
  temp.tx = C2K(39.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 232.5;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(39.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 730;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'BrowKing2005';
  temp.tR = C2K(39.5);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = 'from the Greater, Caribbean and Chilean Flamingos';
data.am = 18250; units.am = 'd';    label.am = 'life span';                bibkey.am = 'BrowKing2005';   
  temp.am = C2K(39.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 85;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'SnowPerr1998';

data.Wwb = 85.5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'ARKive';
data.Wwi = 1725; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'ARKive';

data.Ri = 1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = {'SeaWorld','ARKive'};   
temp.Ri = C2K(39.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % age (d) weight (g)
 1 244.7104913;
 6	322.469108;
 8	345.8653161;
10	394.9513242;
13	456.4944904;
15	557.6655146;
17	599.4961152;
19	636.1517327;
21	634.7150044;
23	690.8474889;
25	792.7010454;
31	900.4735611;
33	826.4684829;
39	976.8546089;
41	1027.461274;
43	1055.42091;
45	1108.683001;
47	1009.750585;
49	1168.014012;
52	1142.333851;
54	1229.424863];
units.tW   = {'d', 'g'};  label.tW = {'time', 'wet weight'};  
temp.tW    = C2K(39.5);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Berr1975';
  
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.tW = weights.tW * 0.1;
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'mod_3: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '6VBLL'; % Cat of Life
metaData.links.id_ITIS = '174978'; % ITIS
metaData.links.id_EoL = '45513555'; % Ency of Life
metaData.links.id_Wiki = 'Phoeniconaias_minor'; % Wikipedia
metaData.links.id_ADW = 'Phoeniconaias_minor'; % ADW
metaData.links.id_Taxo = '169341'; % Taxonomicon
metaData.links.id_WoRMS = '212710'; % WoRMS
metaData.links.id_avibase = 'B06A9079584A8D53'; % avibase
metaData.links.id_birdlife = 'lesser-flamingo-phoeniconaias-minor'; % birdlife
metaData.links.id_AnAge = 'Phoeniconaias_minor'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Phoeniconaias_minor}}';
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
bibkey = 'BechJoha1979'; type = 'Article'; bib = [ ... 
'author = {Bech, C. and Johansen, K. and Maloiy, M. O.}, ' ... 
'year = {1979}, ' ...
'title = {Ventilation and expired gas composition in the flamingo, \emph{Phoenicopterus ruber}, during normal respiration and panting.}, ' ...
'journal = {Physiological Zoology}, ' ...
'volume = {52}, ' ...
'number = {3}, '...
'pages = {313--328}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Berr1975'; type = 'Incollection'; bib = [ ... 
'author = {Berry, H. H.}, ' ... 
'year = {1975}, ' ...
'title = {Hand-rearing Lesser Flamingos}, ' ...
'booktitle = {Flamingos}, ' ...
'editor = {Kear, J. and Duplaix-Hall, N.}, ' ...
'publisher = {T. \& A.D. Poyser}, ' ...
'address = {Berkhamstead}, '...
'pages = {109--117}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BrowKing2005'; type = 'Techreport'; bib = [ ... 
'author = {Brown, C. and King, C.}, ' ... 
'year = {2005}, ' ...
'title = {Flamingo Husbandry Guidelines}, ' ...
'institution = {AZA \& EAZA}, ' ...
'address = {Dallas \& Rotterdam}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MahoJehl1984'; type = 'Article'; bib = [ ... 
'author = {Mahoney, S. A. and Jehl, J. R.}, ' ... 
'year = {1984}, ' ...
'title = {Body water content in marine birds}, ' ...
'journal = {The Condor}, ' ...
'volume = {86}, ' ...
'pages = {208--209}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SnowPerr1998'; type = 'Book'; bib = [ ... 
'author = {Snow, D. W. and Perrins, C. M.}, ' ... 
'year = {1998}, ' ...
'title = {The Birds of the Western Palearctic, Concise Edition}, ' ...
'publisher = {Oxford University Press}, ' ...
'address = {Oxford}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SeaWorld'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.seaworld.org}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ARKive'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.arkive.org/lesser-flamingo/phoeniconaias-minor/}}';
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

