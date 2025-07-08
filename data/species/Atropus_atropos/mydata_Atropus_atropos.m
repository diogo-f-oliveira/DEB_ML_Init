  function [data, auxData, metaData, txtData, weights] = mydata_Atropus_atropos
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Carangiformes'; 
metaData.family     = 'Carangidae';
metaData.species    = 'Atropus_atropos'; 
metaData.species_en = 'Cleftbelly trevally'; 

metaData.ecoCode.climate = {'MA','MB'};
metaData.ecoCode.ecozone = {'MI','MPSW'};
metaData.ecoCode.habitat = {'0iMdb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 06 28];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 06 28];

%% set data
% zero-variate data
data.ab = 4; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(28.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 5*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(28.2);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 17.1;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 31.6;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 4.77e-5;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'RakhNirm2023';
  comment.Wwb = 'based on egg diameter of 0.45 mm: pi/6*0.045^3';
data.Wwp = 72.2;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','RakhNirm2023'};
  comment.Wwp = 'based on 0.02089*Lp^2.87, see F1';
data.Wwi = 420.8;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02089*Li^2.87, see F1';

data.Ri  = 2*372344/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate at TL 25.3 cm';  bibkey.Ri  = 'RakhNirm2023';  
  temp.Ri = C2K(28.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of 372344, spawning 2 times per season';

% uni-variate data
data.tL = [ ... % time since brth (yr), total length (cm)
    1 12.40
    2 19.75
    3 23.25];
data.tL(:,1) = (data.tL(:,1)+ 0)*365; % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(28.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = 'Wiki';
comment.tL = 'DevaKuru1997 gives 32.1, 41.2, 44.0 for yr 1, 2, 3; but this is at odds with Li';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;
weights.ab = weights.ab * 0;
weights.Wwi = weights.Wwi * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.02089*(TL in cm)^2.87'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'JM8D'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46578125'; % Ency of Life
metaData.links.id_Wiki = 'Atropus_atropos'; % Wikipedia
metaData.links.id_ADW = 'Atropus_atropos'; % ADW
metaData.links.id_Taxo = '162606'; % Taxonomicon
metaData.links.id_WoRMS = '279823'; % WoRMS
metaData.links.id_fishbase = 'Atropus-atropos'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Atropus_atropos}}';  
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
bibkey = 'DevaKuru1997'; type = 'techreport'; bib = [ ... 
'howpublished = {\url{https://core.ac.uk/download/pdf/33017552.pdf}}, ' ...
'author = {Devaraj, M. and K.N. Kurup and N.G.K. Pillai and K. Bala and E. Vivekanandan and R. Sathiadhas}, ' ...
'year = {1997}, ' ...
'title = {Status, prospects and management of small pelagic fisheries in {I}ndia}, ' ... 
'journal = {RAP Publication: Bangkok, Thailand}, ' ...
'volume = {31}, '...
'pages = {191-198}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RakhNirm2023'; type = 'article'; bib = [ ... 
'author = {Akanksha V. Rakhunde and Vivek H. Nirmale and Ravindra A. Pawar and Santosh Y. Metar and Bhaskar P. Bhosale}, ' ...
'year = {2023}, ' ...
'title = {Biology of the cleftbelly trevally \emph{Atropus atropos} ({B}loch and {S}chneider, 1801) from {R}atnagiri coast of {I}ndia}, ' ... 
'journal = {Indian J. Fish.}, ' ...
'volume = {70(2)}, '...
'pages = {33-40}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Atropus-atropos.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  