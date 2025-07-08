function [data, auxData, metaData, txtData, weights] = mydata_Bucephala_clangula
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Anseriformes'; 
metaData.family     = 'Anatidae';
metaData.species    = 'Bucephala_clangula'; 
metaData.species_en = 'Common goldeneye'; 

metaData.ecoCode.climate = {'Dfc','Dfd'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'biFp', 'biFm', 'biMm'};
metaData.ecoCode.embryo  = {'Tnwf'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCi', 'xiHl', 'xiHr'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.2); % K
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 09 08];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 11];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2023 04 10];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_3     = [2023 06 24];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 24];

%% set data
% zero-variate data

data.ab = 30;   units.ab = 'd';      label.ab = 'age at birth';                    bibkey.ab = 'AnAge';   
  temp.ab = C2K(33);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'avibase: 28 till 32 d';
data.tx = 58;   units.tx = 'd';      label.tx = 'time since birth at fledging';   bibkey.tx = 'avibase';   
  temp.tx = C2K(41.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '56-60';
data.tp = 100;   units.tp = 'd';      label.tp = 'time since birth at puberty';   bibkey.tp = 'guess';   
  temp.tp = C2K(41.2);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 730;    units.tR = 'd';  label.tR = 'time since birth at 1st brood';   bibkey.tR = 'AnAge';
  temp.tR = C2K(41.2);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 20.9 * 365;  units.am = 'd'; label.am = 'life span';                       bibkey.am = 'AnAge';   
  temp.am = C2K(41.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 57;  units.Ww0 = 'g';    label.Ww0 = 'initial wet weight';             bibkey.Ww0 = 'avibase';
data.Wwb = 38.1;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'AnAge';
data.Wwi = 800; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'avibase';
data.Wwim = 1000; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'avibase';

data.Ri  = 10/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';          bibkey.Ri  = 'AnAge';   
 temp.Ri = C2K(41.2);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 comment.Ri = '1 clutch per yr, 5-15 eggs per clutch';

% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (d), weight (g)
    1  35.5
    1  34
    8  93
    8  63
   15 175
   15 104
   22 240
   22 275
   29 385
   29 325
   36 465
   36 430
   43 550
   43 535
   50 555
   50 555
   57 560
   57 560
   64 560
   64 575
   71 595
   71 625
  120 570
  120 560];
n=size(data.tW_f,1); for i=2:n; if data.tW_f(i,1)<=data.tW_f(i-1,1); data.tW_f(i,1)=data.tW_f(i-1,1)+1e-4;end;end
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(41.2);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'BlumKraus1990';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (d), weight (g)
    1  36
    1  35
    1  35.5
    8  90
    8  90
    8  75
   15 195
   15 191
   15 100
   22 265
   22 275
   22 260
   29 420
   29 455
   29 300
   36 580
   36 600
   36 510
   43 810
   43 750
   43 620
   50 825
   50 780
   50 680
   57 850
   57 800
   57 720
   64 860
   64 825
   64 725
   71 870
   71 855
   71 810
  120 1000
  120 920
  120 910];
n=size(data.tW_m,1); for i=2:n; if data.tW_m(i,1)<=data.tW_m(i-1,1); data.tW_m(i,1)=data.tW_m(i-1,1)+1e-4;end;end
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(41.2);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'BlumKraus1990';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_m = weights.tW_m * 2;
weights.tW_f = weights.tW_f * 2;
weights.Ww0 =  0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Body temperature is guessed';
D2 = 'males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1: v is reduced';
D4 = 'mod_2: males have equal state variables at b, compared to females';
D5 = 'mod_3: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);  

%% Links
metaData.links.id_CoL = 'NM25'; % Cat of Life
metaData.links.id_ITIS = '175141'; % ITIS
metaData.links.id_EoL = '45510601'; % Ency of Life
metaData.links.id_Wiki = 'Bucephala_clangula'; % Wikipedia
metaData.links.id_ADW = 'Bucephala_clangula'; % ADW
metaData.links.id_Taxo = '52260'; % Taxonomicon
metaData.links.id_WoRMS = '159197'; % WoRMS
metaData.links.id_avibase = '68EA281AF74846D2'; % avibase
metaData.links.id_birdlife = 'common-goldeneye-bucephala-clangula'; % birdlife
metaData.links.id_AnAge = 'Bucephala_clangula'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bucephala_clangula}}';
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
bibkey = 'BlumKraus1990'; type = 'book'; bib = [ ... 
'author = {Hans Bl\"{u}mel and Rudolf Krause}, ' ... 
'year = {1990}, ' ...
'title = {Die Schellente}, ' ...
'series = {Die Neue Brehm-B\"{u}cherei}, ' ...
'volume = {605}, ' ...
'address = {Wittenberg, Lutherstadt}, ' ...
'publisher = {A Ziemsen Verlag}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Bucephala_clangula}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=68EA281AF74846D2&sec=lifehistory}}';
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

