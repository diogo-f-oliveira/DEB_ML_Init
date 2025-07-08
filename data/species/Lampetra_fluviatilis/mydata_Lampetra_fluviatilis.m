function [data, auxData, metaData, txtData, weights] = mydata_Lampetra_fluviatilis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Cephalaspidomorphi'; 
metaData.order      = 'Petromyzontiformes'; 
metaData.family     = 'Petromyzontidae';
metaData.species    = 'Lampetra_fluviatilis'; 
metaData.species_en = 'River lamprey'; 

metaData.ecoCode.climate = {'Cfa','MC'};
metaData.ecoCode.ecozone = {'THp','MANE'};
metaData.ecoCode.habitat = {'0iFr','piMc'};
metaData.ecoCode.embryo  = {'Fnfm'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'bpD','piTvf'};
metaData.ecoCode.gender  = {'Dt'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(9.8); % K, body temperature
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};                             
metaData.date_subm = [2023 12 31];                          
metaData.email     = {'bas.kooijman@vu.nl'};                 
metaData.address   = {'VU University Amsterdam'};      

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 12 31];

%% set data
% zero-variate data;
data.ab = 15;    units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'fishbase';   
  temp.ab = C2K(15); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(9.8); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 34.8;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';bibkey.Lp  = 'fishbase';
data.Li  = 50;     units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 2.9e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.821 mm of Lampetra_lanceolata: pi/6*0.0821^3';
data.Wwp = 75.7;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00126*Lp^3.06, see F2)';
data.Wwi = 199;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00126*Li^3.06, see F2; max published weight 150 g)';

data.NR  = 4100;   units.NR  = '#';   label.NR  = 'eggs at the end of life';bibkey.NR  = 'fishbase';   
  temp.NR = C2K(9.8); units.temp.NR = 'K'; label.temp.NR = 'temperature';

% uni-variate data at f
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    0  3.4
    1  6.5
    2  9.0];
data.tL(:,1) = 365 * (0.8+data.tL(:,1));
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(9.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HardHugg1970';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'spawns once at end of life; parasitic';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'length-weight: Ww in g = 0.00126*(TL in cm)^3.06';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6NVLC'; % Cat of Life
metaData.links.id_ITIS = '159719'; % ITIS
metaData.links.id_EoL = '46582323'; % Ency of Life
metaData.links.id_Wiki = 'Lampetra_fluviatilis'; % Wikipedia
metaData.links.id_ADW = 'Lampetra_fluviatilis'; % ADW
metaData.links.id_Taxo = '41685'; % Taxonomicon
metaData.links.id_WoRMS = '101172'; % WoRMS
metaData.links.id_fishbase = 'Lampetra-fluviatilis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lampetra_fluviatilis}}';  
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
bibkey = 'HardHugg1970'; type = 'article'; bib = [ ...  
'doi = {10.1111/j.1469-7998.1970.tb02055.x}, ' ...
'author = {M. W. Hardisty and R. J. Huggins}, ' ...
'year = {1970}, ' ...
'title  = {Larval growth in the river lamprey, \emph{Lampetra fluviatilis}}, ' ...
'journal = {J. Zool., Lond.}, ' ...
'volume = {161(2)}, ' ...
'page = {549–559}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Lampetra-fluviatilis.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
