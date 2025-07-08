function [data, auxData, metaData, txtData, weights] = mydata_Lampetra_aepyptera

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Cephalaspidomorphi'; 
metaData.order      = 'Petromyzontiformes'; 
metaData.family     = 'Petromyzontidae';
metaData.species    = 'Lampetra_aepyptera'; 
metaData.species_en = 'Least brook lamprey'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFc'};
metaData.ecoCode.embryo  = {'Ft'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biD'};
metaData.ecoCode.gender  = {'Dt'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(14); % K, body temperature
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman','Starrlight Augustine'};                             
metaData.date_subm = [2020 07 14];                          
metaData.email     = {'sta@akvaplan.niva.no'};                 
metaData.address   = {'Akvaplan-niva, FRAM, Tromso, Norway'};      

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2020 07 14]; 

%% set data
% zero-variate data;
data.am = 8*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'Wiki';   
  temp.am = C2K(14); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'temp is guessed';

data.Lp  = 6;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';bibkey.Lp  = 'DockBeam1994';
data.Li  = 18;     units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 5.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.66-1.36 mm: pi/6*0.1^3';
data.Wwp = 0.26;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00120*Lp^3, see F2)';
data.Wwi = 7;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00120*Li^3, see F2)';

data.NR  = 5900;   units.NR  = '#';   label.NR  = 'eggs at the end of life';bibkey.NR  = 'DockBeam1991';   
  temp.NR = C2K(14); units.temp.NR = 'K'; label.temp.NR = 'temperature';

% uni-variate data at f
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
1	3.691
2	5.840
3	7.824
4	10.689
5	13.003];
data.tL(:,1) = 365 * data.tL(:,1);
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(14);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'DockBeam1994';
comment.tL = 'Data from Budler Mill Branch';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion
D1 = 'assumption: Ww_i excludes eggs';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'spawns once at end of life; no feeding as adult, no parasitic stage';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'length-weight: Ww in g = 0.00120*(TL in cm)^3';
metaData.bibkey.F2 = 'fishbase';
F3 = 'Ammocoetes do not have a predetermined sex; instead, they all rapidly produce eggs until about 17 months of age. Sex is determined by environmental factors including stream temperature, population density, average growth rate, and pH. Males then re-absorb the eggs, though it is not uncommon for male ammocoetes to still have eggs in their testes.';
metaData.bibkey.F3 = 'DockBeam1994';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = '3S39H'; % Cat of Life
metaData.links.id_ITIS = '159705'; % ITIS
metaData.links.id_EoL = '215933'; % Ency of Life
metaData.links.id_Wiki = 'Lampetra_aepyptera'; % Wikipedia
metaData.links.id_ADW = 'Lampetra_aepyptera'; % ADW
metaData.links.id_Taxo = '178154'; % Taxonomicon
metaData.links.id_WoRMS = '1026288'; % WoRMS
metaData.links.id_fishbase = 'Lampetra-aepyptera'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lampetra_aepyptera}}';  
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
bibkey = 'DockBeam1991'; type = 'article'; bib = [ ...  
'author = {Margaret F. Docker and F. William H. Beamish}, ' ...
'year = {1991}, ' ...
'title  = {Growth, fecundity, and egg size of least brook lamprey, \emph{Lampetra aepyptera}}, ' ...
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {31}, ' ...
'page = {219-227}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DockBeam1994'; type = 'article'; bib = [ ...  
'author = {Margaret F. Docker and F. William H. Beamish}, ' ...
'year = {1994}, ' ...
'title  = {Age, growth, and sex ratio among populations of least brook lamprey, \emph{Lampetra aepyptera}, larvae: an argument for environmental sex determination}, ' ...
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {41}, ' ...
'page = {191-205}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Lampetra-aepyptera.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
