function [data, auxData, metaData, txtData, weights] = mydata_Pentaceros_richardsoni
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acropomatiformes'; 
metaData.family     = 'Pentacerotidae';
metaData.species    = 'Pentaceros_richardsoni'; 
metaData.species_en = 'Pelagic armourhead'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MI'};
metaData.ecoCode.habitat = {'0iMm'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(11.6); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 09 08];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 08];

%% set data
% zero-variate data

data.ab = 4.9;     units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(11.6);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 60*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(11.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 24;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'guess'; 
data.Li  = 56;   units.Li  = 'cm';  label.Li  = 'ultimate total length';     bibkey.Li  = 'fishbase';

data.Wwb = 2.1e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length of 1.1 mm and width of 0.6 mm: pi/6*0.11*0.06^2';
data.Wwp = 176;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.01122*Lp^3.04, see F1';
data.Wwi = 2.3e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for males';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01122*Li^3.04, see F1';

data.GSI = 0.098; units.GSI = 'g/g';  label.GSI = 'gonado somatic index'; bibkey.GSI = 'guess';
  temp.GSI = C2K(11.6); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Pentaceropsis_recurvirostris';

% uni-variate data
% time-length
data.tL = [... %  yr class (yr), total length (cm)
    4 50.2
    5 51.6
    6 54.3
    7 56.0
    8 59.5
    9 61.0
   10 62.5
   11 63.5
   12 60.5
   13 66.5];
data.tL(:,1) = (data.tL(:,1)+0)*365; % convert yr to d
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(11.6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'LopeSant2008';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;
weights.Li = 5 * weights.Li;
weights.Lp = 3 * weights.Lp;
weights.Wwi = 5 * weights.Wwi;
weights.Wwb = 3 * weights.Wwb;
weights.GSI = 3 * weights.GSI;

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
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Weight-length: Ww in g = 0.01122*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '76MDK'; % Cat of Life
metaData.links.id_ITIS = '169699'; % ITIS
metaData.links.id_EoL = '223504'; % Ency of Life
metaData.links.id_Wiki = 'Pentaceros_richardsoni'; % Wikipedia
metaData.links.id_ADW = 'Pentaceros_richardsoni'; % ADW
metaData.links.id_Taxo = '515712'; % Taxonomicon
metaData.links.id_WoRMS = '313240'; % WoRMS
metaData.links.id_fishbase = 'Pentaceros-richardsoni'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pentaceros_richardsoni}}';
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
bibkey = 'LopeSant2008'; type = 'Article'; bib = [ ... 
'doi = {10.1071/mf07131}, ' ...
'author = {L\''{o}pez-Abell\''{a}n, L. J. and Santamaría, M. T. G. and Gonz\''{a}lez, J. F.}, ' ... 
'year = {2008}, ' ...
'title = {Approach to ageing and growth back-calculation based on the otolith of the southern boarfishPseudopentaceros richardsoni(Smith, 1844) from the south-west Indian Ocean seamounts}, ' ...
'journal = {Marine and Freshwater Research}, ' ...
'volume = {59(3)}, ' ...
'pages = {269-278}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Pentaceros-richardsoni.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

