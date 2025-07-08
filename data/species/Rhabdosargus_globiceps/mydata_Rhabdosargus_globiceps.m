function [data, auxData, metaData, txtData, weights] = mydata_Rhabdosargus_globiceps

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Rhabdosargus_globiceps'; 
metaData.species_en = 'White stumpnose'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MASE'};
metaData.ecoCode.habitat = {'0iMp','jiMc'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi','jiHl'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 12 10];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 10];

%% set data
% zero-variate data

data.ab = 6.5;      units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'guess';   
  temp.ab = C2K(25); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Diplodus puntazzo';
data.am = 10*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'AlKi2013';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 23;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase';  
data.Li  = 65;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.85 mm of Diplodes sargus: pi/6*0.085^3';
data.Wwp = 235.8;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based in 0.01820*Lp^3.02, see F1';
data.Wwi = 5433;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based in 0.01820*Li^3.02, see F1';

data.GSI  = 0.045; units.GSI  = '-'; label.GSI  = 'gonado-somatic index'; bibkey.GSI = 'AlKi2013';   
  temp.GSI = C2K(25); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    1  9.0
    2 15.0
    3 22.0
    4 26.0];
data.tL(:,1) = (0.2+data.tL(:,1)) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth','fork length'};  
temp.tL    = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Talb1955'; 

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

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.01820*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4RW7X'; % Cat of Life
metaData.links.id_ITIS = '647975'; % ITIS
metaData.links.id_EoL = '46580012'; % Ency of Life
metaData.links.id_Wiki = 'Rhabdosargus_globiceps'; % Wikipedia
metaData.links.id_ADW = 'Rhabdosargus_globiceps'; % ADW
metaData.links.id_Taxo = '45321'; % Taxonomicon
metaData.links.id_WoRMS = '218624'; % WoRMS
metaData.links.id_fishbase = 'Rhabdosargus-globiceps'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rhabdosargus_globiceps}}';
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
bibkey = 'Talb1955'; type = 'article'; bib = [ ... 
'doi = {10.1080/00359195509518998}, ' ...
'author = {Talbot, F. H.}, ' ... 
'year = {1955}, ' ...
'title = {NOTES ON THE BIOLOGY OF THE WHITE STUMPNOSE, \emph{Rhabdosargus globiceps} ({C}UVIER), AND ON THE FISH FAUNA OF THE {K}LEIN {R}IVER {E}STUARY}, ' ...
'journal = {Transactions of the Royal Society of South Africa}, ' ...
'volume = {34(3)}, ' ...
'pages = {387–407}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Rhabdosargus-globiceps.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
