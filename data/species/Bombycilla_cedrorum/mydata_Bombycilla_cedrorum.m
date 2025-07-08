function [data, auxData, metaData, txtData, weights] = mydata_Bombycilla_cedrorum

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Bombycillidae';
metaData.species    = 'Bombycilla_cedrorum'; 
metaData.species_en = 'Cedar waxwing'; 

metaData.ecoCode.climate = {'BSh','Csa','Dsa','Dfa','Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnpfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 08 20];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 18];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 08];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 08];

%% set data
% zero-variate data

data.ab = 12;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'avibase';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 14;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Putm1949';   
  temp.tx = C2K(41.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 42;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'avibase';
  temp.tR = C2K(41.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 12.6*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'avibase';   
  temp.am = C2K(41.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 2.7; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Putm1949';
data.Wwi = 31.8;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for female';     bibkey.Wwi = 'avibase';

data.Ri  = 4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(41.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-6 egss/clutch, ';
 
% uni-variate data
% time-weight 
data.tW1 = [ ... % scaled time since birth (d), wet weight (g)
    0    2.7
    0.5  3.5
    1    5.4
    1.5  5.5
    2    7.9
    2.5  7.4
    3   11.1
    3.5 10.9
    4   14.9
    4.5 14.1
    5   17.8
    5.5 16.3
    6   22.5
    6.5 20.9
    7   26.9
    7.5 23.6
    8   28.3
    8.5 26.4
    9   30.8
    9.5 29.1
   10   32.0
   10.5 29.8
   11   32.0
   11.5 32.4
   12   35.0
   12.5 33.5
   13   32.2
   13.5 31.2
   14   32.8];
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight'};  
temp.tW1    = C2K(41.6);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1  = 'Putm1949';
%
data.tW2 = [ ... % scaled time since birth (d), wet weight (g)
    0    3.2
    0.5  3.6
    1    5.2
    1.5  5.3
    2    8.1
    2.5  8.2
    3   11.9
    3.5 10.7
    4   15.6
    4.5 14.2
    5   19.1
    5.5 18.8
    6   22.2
    6.5 21.3
    7   25.5
    7.5 24.5
    8   29.6
    8.5 28.5
    9   30.7
    9.5 30.1
   10   31.6
   10.5 31.0
   11   33.5
   11.5 31.6
   12   33.0
   12.5 32.6
   13   34.0
   13.5 30.4
   14   34.3];
units.tW2   = {'d', 'g'};  label.tW2 = {'time since birth', 'wet weight'};  
temp.tW2    = C2K(41.6);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2  = 'Putm1949';
%
data.tW3 = [ ... % scaled time since birth (d), scaled wet weight (g)
    0    3.2
    0.5  4.0
    1    6.2
    1.5  6.7
    2    8.7
    2.5  8.1
    3   12.9
    3.5 11.8
    4   16.3
    4.5 15.1
    5   20.4
    5.5 18.3
    6   23.5
    6.5 22.4
    7   27.3
    7.5 25.0
    8   30.6
    8.5 28.7
    9   31.6
    9.5 29.9
   10   31.7
   10.5 31.0
   11   33.2
   11.5 31.0
   12   35.2
   12.5 33.3
   13   33.9
   13.5 32.6
   14   33.8];
units.tW3   = {'d', 'g'};  label.tW3 = {'time since birth', 'wet weight'};  
temp.tW3    = C2K(41.6);  units.temp.tW3 = 'K'; label.temp.tW3 = 'temperature';
bibkey.tW3  = 'Putm1949';
%
data.tW4 = [ ... % scaled time since birth (d), scaled wet weight (g)
    0    3.2
    0.5  3.7
    1    5.4
    1.5  5.4
    2    8.3
    2.5  8.5
    3   12.6
    3.5 11.1
    4   17.0
    4.5 14.5
    5   20.2
    5.5 18.4
    6   24.3
    6.5 22.6
    7   28.5
    7.5 27.1
    8   31.7
    8.5 29.1
    9   31.4
    9.5 30.3
   10   34.5
   10.5 33.4
   11   36.2
   11.5 33.7
   12   35.6
   12.5 34.4
   13   35.8];
units.tW4   = {'d', 'g'};  label.tW4 = {'time since birth', 'wet weight'};  
temp.tW4    = C2K(41.6);  units.temp.tW4 = 'K'; label.temp.tW4 = 'temperature';
bibkey.tW4  = 'Putm1949';

%% set weights for all real data
weights = setweights(data, []);
weights.tW4 = weights.tW4 * 2;
weights.tW3 = weights.tW3 * 2;
weights.tW2 = weights.tW2 * 2;
weights.tW1 = weights.tW1 * 2;

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
set1 = {'tW1','tW2','tW3','tW4'}; subtitle1 = {'Data for individuals 1,2,3,4'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'food intake reduces a little prior to fledging';
D2 = 'mod_1: v is reduced, fod availability is taken variable in tW data';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = 'MFZ9'; % Cat of Life
metaData.links.id_ITIS = '178532'; % ITIS
metaData.links.id_EoL = '45510954'; % Ency of Life
metaData.links.id_Wiki = 'Bombycilla_cedrorum'; % Wikipedia
metaData.links.id_ADW = 'Bombycilla_cedrorum'; % ADW
metaData.links.id_Taxo = '56697'; % Taxonomicon
metaData.links.id_WoRMS = '1484311'; % WoRMS
metaData.links.id_avibase = '9437D635FF4E2607'; % avibase
metaData.links.id_birdlife = 'cedar-waxwing-bombycilla-cedrorum'; % birdlife
metaData.links.id_AnAge = 'Bombycilla_cedrorum'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bombycilla_cedrorum}}';
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
bibkey = 'Putm1949'; type = 'Article'; bib = [ ... 
'author = {Loren S. Putnam}, ' ... 
'year = {1949}, ' ...
'title = {The Life History of the Cedar Waxwing}, ' ...
'journal = {The Wilson Bulletin}, ' ...
'volume = {61(3)}, ' ...
'pages = {141-182}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Bombycilla_cedrorum}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=9437D635FF4E2607&sec=lifehistory}}';
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

