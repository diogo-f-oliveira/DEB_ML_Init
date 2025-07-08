function [data, auxData, metaData, txtData, weights] = mydata_Aegotheles_cristatus 

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Aegotheliformes'; 
metaData.family     = 'Aegothelidae';
metaData.species    = 'Aegotheles_cristatus'; 
metaData.species_en = 'Australian owlet-nightjar'; 

metaData.ecoCode.climate = {'Cfa', 'Cfb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.7); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Li'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2015 09 28];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 11 25];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2017 11 23];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_3     = [2023 06 29];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 29];

%% set data
% zero-variate data

data.ab = 26;     units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'Holy2001';  
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '25-27 d; temps taken from Podargus_strigoides';
data.tx = 28;     units.tx = 'd';    label.tx = 'nestling period';         bibkey.tx = 'Holy2001';  
  temp.tx = C2K(39.7);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '21-29 (32) d; eyes open at 4-5 d, second down at 11-12 d, feathered at 14-17 d';
data.tp = 84;     units.tp = 'd';    label.tp = 'nestling period';         bibkey.tp = 'guess';  
  temp.tp = C2K(39.7);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '21-29 (32) d; eyes open at 4-5 d, second down at 11-12 d, feathered at 14-17 d';
data.tR = 340;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'guess';
  temp.tR = C2K(39.7);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 15*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'biokids';   
  temp.am = C2K(39.7);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'Value for Caprimulgus vociferus, which is related and equal Wwi';

%data.L0  = 2.98;  units.L0  = 'cm';  label.L0  = 'egg length';             bibkey.L0  = 'Holy2001';
%  comment.L0 = '2.3 cm egg width L0w';
data.Li  = 25;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'Holy2001';
  comment.Li = '21-25';

data.Ww0  = 8;     units.Ww0  = 'g';   label.Ww0  = 'egg wet weight';      bibkey.Ww0  = 'Holy2001';
  comment.Ww0 = 'Computed as pi*L0*L0w^2/6; probably an overestimation';
data.Wwb = 7;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = '0.8*W0 to account for water and energy loss';
data.Wwi = 60;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'Holy2001';
  comment.Wwi = 'males 43-60 g, females 42-62 g';

data.Ri  = 4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'Holy2001';   
  temp.Ri = C2K(39.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-5 eggs, usually 3-4, one brood per year';

%% set weights for all real data
weights = setweights(data, []);

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

%% Facts
F1 = ['Rock crevices (T IN +9 C to +33 C) were warmer and thermally more stable than tree hollows (T IN ?4.0 C to +37 C)' ...
    'Torpor, often expressed by a reduction of T skin/ Tb by >10 C for 3-4h at dawn,was influenced by roost selection; torpor use in tree hollows was almost twice that in rock crevices'];
metaData.bibkey.F1 = 'DoucBrig2011'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '64WVG'; % Cat of Life
metaData.links.id_ITIS = '555504'; % ITIS
metaData.links.id_EoL = '45516372'; % Ency of Life
metaData.links.id_Wiki = 'Aegotheles_cristatus'; % Wikipedia
metaData.links.id_ADW = 'Aegotheles_cristatus'; % ADW
metaData.links.id_Taxo = '54805'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '175A7534149FDC90'; % avibase
metaData.links.id_birdlife = 'australian-owlet-nightjar-aegotheles-cristatus'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Aegotheles_cristatus}}';
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
bibkey = 'DoucBrig2011'; type = 'Article'; bib = [ ... 
'author = {L. I. Doucette and R. M. Brigham and C. R. Pavey and F. Geiser}, ' ... 
'year = {2011}, ' ...
'title = {Roost type influences torpor use by {A}ustralian owlet-nightjars}, ' ...
'journal = {Naturwissenschaften}, ' ...
'doi = {DOI 10.1007/s00114-011-0835-7}, ' ...
'volume = {98}, ' ...
'pages = {845--854}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BrigGeis1997'; type = 'Article'; bib = [ ... 
'author = {Brigham, R. M. and F. Geiser}, ' ... 
'year = {1997}, ' ...
'title = {Breeding biology of Australian Owlet-nightjars \emph{Aegotheles cristatus} in eucalypt woodland}, ' ...
'journal = {Emu}, ' ...
'volume = {97}, ' ...
'pages = {316--321}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Holy2001'; type = 'Book'; bib = [ ... 
'author = {Holyoak, D. T.}, ' ... 
'year = {2001}, ' ...
'title = {Nightjars and their allies}, ' ...
'publisher = {Oxford University Press}, ' ...
'isbn = {0 19 854987 3}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'biokids'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.biokids.umich.edu/critters/Caprimulgus_vociferus/}}';
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

