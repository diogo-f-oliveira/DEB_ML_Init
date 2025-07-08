function [data, auxData, metaData, txtData, weights] = mydata_Accipiter_cooperii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Accipitriformes'; 
metaData.family     = 'Accipitridae';
metaData.species    = 'Accipiter_cooperii'; 
metaData.species_en = 'Cooper''s hawk'; 

metaData.ecoCode.climate = {'BW','BS','Csa','Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTh', '0iTi', '0iTf'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCi', 'biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 08 20];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 11 17];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 03];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 03];

%% set data
% zero-variate data

data.ab = 22;        units.ab = 'd';    label.ab = 'age at birth';                 bibkey.ab = 'AnAge';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 25;        units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Sumn1929';   
  temp.tx = C2K(40); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 75;        units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 730;       units.tR = 'd';    label.tR = 'time since birth at 1st brood';bibkey.tR = 'AnAge';
  temp.tR = C2K(40); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 20.3*365;    units.am = 'd';    label.am = 'life span';                    bibkey.am = 'AnAge';   
  temp.am = C2K(40); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 22;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';         bibkey.Wwb = 'Sumn1929';
data.Wwi = 518;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'Wiki';
  comment.Wwi = 'Wiki reports considerable geographic variation';
data.Wwim = 342;    units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for male';  bibkey.Wwim = 'Wiki';
  comment.Wwim = 'Wiki reports considerable geographic variation';

data.Ri  = 4/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';         bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(40); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-weight
data.tW1 = [ ... % time since birth (d), ln wet weight (ln g)
0.000	19.859
5.000	48.738
12.267	168.501
18.933	301.458
25.067	373.142];  
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight', 'ind 1'};  
temp.tW1    = C2K(40);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'Sumn1929';
%
data.tW2 = [ ... % time since birth (d), ln wet weight (ln g)
0.000	21.180
5.067	77.072
12.133	204.748
19.067	280.367
25.067	287.475];  
units.tW2   = {'d', 'g'};  label.tW2 = {'time since birth', 'wet weight', 'ind 2'};  
temp.tW2    = C2K(40);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2 = 'Sumn1929';
%
data.tW3 = [ ... % time since birth (d), ln wet weight (ln g)
0.000	25.131
5.133	87.614
12.200	219.244
19.067	270.482
24.933	281.547];  
units.tW3   = {'d', 'g'};  label.tW3 = {'time since birth', 'wet weight', 'ind 3'};  
temp.tW3   = C2K(40);  units.temp.tW3 = 'K'; label.temp.tW3 = 'temperature';
bibkey.tW3 = 'Sumn1929';
%
data.tW4 = [ ... % time since birth (d), ln wet weight (ln g)
0.000	22.493
5.200	73.115
12.267	198.155
19.067	264.552
25.067	282.862];  
units.tW4   = {'d', 'g'};  label.tW4 = {'time since birth', 'wet weight', 'ind 4'};  
temp.tW4   = C2K(40);  units.temp.tW4 = 'K'; label.temp.tW4 = 'temperature';
bibkey.tW4 = 'Sumn1929';

%% set weights for all real data
weights = setweights(data, []);
weights.tW1 = weights.tW1 * 2; 
weights.tW2 = weights.tW2 * 2; 
weights.tW3 = weights.tW3 * 2; 
weights.tW4 = weights.tW4 * 2; 

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
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'food intake varies somewhat in time';
D3 = 'mod_3: v reduced';
D4 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = '64FV9'; % Cat of Life
metaData.links.id_ITIS = '175309'; % ITIS
metaData.links.id_EoL = '45511394'; % Ency of Life
metaData.links.id_Wiki = 'Accipiter_cooperii'; % Wikipedia
metaData.links.id_ADW = 'Accipiter_cooperii'; % ADW
metaData.links.id_Taxo = '52537'; % Taxonomicon
metaData.links.id_WoRMS = '159103'; % WoRMS
metaData.links.id_avibase = 'EB98812F50A648A1'; % avibase
metaData.links.id_birdlife = 'coopers-hawk-accipiter-cooperii'; % birdlife
metaData.links.id_AnAge = 'Accipiter_cooperii'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Accipiter_cooperii}}';
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
bibkey = 'Sumn1929'; type = 'Article'; bib = [ ... 
'author = {E. L. Sumner}, ' ... 
'year = {1929}, ' ...
'title = {Comparative Studies in the Growth of Young Raptores}, ' ...
'journal = {The Condor}, ' ...
'volume = {31(3)}, ' ...
'pages = {85-111}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Accipiter_cooperii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=EB98812F50A648A1&sec=lifehistory}}';
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

