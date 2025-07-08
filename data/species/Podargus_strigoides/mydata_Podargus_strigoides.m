function [data, auxData, metaData, txtData, weights] = mydata_Podargus_strigoides

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Podargiformes'; 
metaData.family     = 'Podargidae';
metaData.species    = 'Podargus_strigoides'; 
metaData.species_en = 'Tawny frogmouth'; 

metaData.ecoCode.climate = {'BSh', 'BSk', 'Cfa'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTh', '0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tnpfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.7); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Carlos MGL Teixeira'};    
metaData.date_subm = [2012 07 31];              
metaData.email    = {'carlos.teixeira@tecnico.ulisboa.pt'};            
metaData.address  = {'Lisbon University'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 11 25];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 29];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 29];

%% set data
% zero-variate data

data.ab = 30;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'ALR';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temps from KuehGood1990 and BechNico1999';
data.tx = 32.5;  units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'ALR';   
  temp.tx = C2K(39.7);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 97.5;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(39.7);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 240;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'Snow2008';
  temp.tR = C2K(39.7);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 14600; units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wood2012';   
  temp.am = C2K(39.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 43.5; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'ALR';

data.Wwb = 14;     units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'KortGeis1999';
data.Wwi = 473.75; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Snow2008';

data.Ri  = 2.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'ALR';   
  temp.Ri = C2K(39.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % weight (g) at age (d)
1	18.05745475
5	38.15229286
9	83.12369029
15	153.0053714
19	184.4764159
22	207.1322766
26	230.1090048];
units.tW  = {'d', 'g'}; label.tW = {'time since birth', 'wet weight'};  
temp.tW   = C2K(39.7);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'KortGeis1999';
  
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
D1 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '4KPK7'; % Cat of Life
metaData.links.id_ITIS = '555510'; % ITIS
metaData.links.id_EoL = '1178209'; % Ency of Life
metaData.links.id_Wiki = 'Podargus_strigoides'; % Wikipedia
metaData.links.id_ADW = 'Podargus_strigoides'; % ADW
metaData.links.id_Taxo = '54798'; % Taxonomicon
metaData.links.id_WoRMS = '1516532'; % WoRMS
metaData.links.id_avibase = '8500F1302409AD32'; % avibase
metaData.links.id_birdlife = 'tawny-frogmouth-podargus-strigoides'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Podargus_strigoides}}';
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
bibkey = 'BechNico1999'; type = 'Article'; bib = [ ... 
'author = {Bech, C. and Nicol, S. C.}, ' ... 
'year = {1999}, ' ...
'title = {Thermoregulation and ventilation in the tawny frogmouth, \emph{Podargus strigoides}: a low-metabolic avian species}, ' ...
'journal = {Australian Journal of Zoology}, ' ...
'volume = {47}, ' ...
'number = {2}, '...
'pages = {143--153}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KortGeis1999'; type = 'Article'; bib = [ ... 
'author = {K\"{o}rtner, G. and Geiser, F.}, ' ... 
'year = {1999}, ' ...
'title = {Nesting Behaviour and Juvenile Development of the Tawny Frogmouth \emph{Podargus strigoides}}, ' ...
'journal = {Emu}, ' ...
'volume = {99}, ' ...
'pages = {212--217}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KortBrig2001'; type = 'Article'; bib = [ ... 
'author = {K\"{o}rtner, G. and Brigham, R. M. and Geiser, F.}, ' ... 
'year = {2001}, ' ...
'title = {Torpor in Free-Ranging Tawny Frogmouths (\emph{Podargus strigoides})}, ' ...
'journal = {Physiological and Biochemical Zoology}, ' ...
'volume = {74}, ' ...
'number = {6}, '...
'pages = {789--797}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Snow2008'; type = 'Techreport'; bib = [ ... 
'author = {Snow, J.}, ' ... 
'year = {2008}, ' ...
'title = {Husbandry Guidelines for Tawny Frogmouth \emph{Podargus strigoides}}, ' ...
'institution = {Western Sydney Institute of TAFE, Richmond.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ALR'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animals.jrank.org/pages/819/Frogmouths-Podargidae-TAWNY-FROGMOUTH-Podargus-strigoides-SPECIES-ACCOUNT.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wood2012'; type = 'Misc'; bib = [ ...
'author = {Woodland Park Zoo}, ' ...
'year = {2012}, ' ...
'howpublished = {\url{http://www.zoo.org}}'];
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

