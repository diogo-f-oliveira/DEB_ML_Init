function [data, auxData, metaData, txtData, weights] = mydata_Epinephelus_fasciatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Epinephelus_fasciatus'; 
metaData.species_en = 'Blacktip grouper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIN','MPSW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 05];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 05];

%% set data
% zero-variate data

data.am = 22 * 365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 16;       units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 52;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwi = 1.8e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01148*Li^3.03, see F1, gives 6.1e3 g';

data.GSI  = 0.15;   units.GSI  = '-'; label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'MishGanz2006';   
  temp.GSI = C2K(28);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% time-length
data.tLW = [ ... % time since birth (yr), total length (cm), weight (g)
    1 18.28  97.434
    2 20.98 159.979
    3 23.20 219.364
    4 25.96 281.916
    5 28.51 360.312
    6 30.77 435.540
    7 32.79 479.075
    8 34.93 560.631];
data.tLW(:,1) = (1.2+data.tLW(:,1)) * 365; % convert yr to d
units.tLW   = {'d', 'cm', 'g'};  label.tLW = {'time since birth', 'total length', 'weight'};  
temp.tLW    = C2K(29);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'SaleAboz2019'; treat.tLW = {1, {'length','weight'}};
  
%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 5 * weights.tLW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0 * weights.psd.k_J; weights.psd.k = .1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

% %% Discussion points
% D1 = '';
% metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: W in g = 0.01148*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'This species combines simultaneous and sequential hermaphroditism';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6G5NR'; % Cat of Life
metaData.links.id_ITIS = '167709'; % ITIS
metaData.links.id_EoL = '46579628'; % Ency of Life
metaData.links.id_Wiki = 'Epinephelus_fasciatus'; % Wikipedia
metaData.links.id_ADW = 'Epinephelus_fasciatus'; % ADW
metaData.links.id_Taxo = '105884'; % Taxonomicon
metaData.links.id_WoRMS = '218207'; % WoRMS
metaData.links.id_fishbase = 'Epinephelus-fasciatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Epinephelus_fasciatus}}';
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
bibkey = 'SaleAboz2019'; type = 'Article'; bib = [ ... 
'author = {Belal M. Saleh and Mohammed M. Abozeid and Ashraf I. Ahmed and Magdy A. Alwany and M. El-Sherbiny}, ' ... 
'year = {2019}, ' ...
'title = {Age and Growth of \emph{Epinephelus fasciatus} from northern {R}ed {S}ea}, ' ...
'journal = {Catrina}, ' ...
'volume = {18(1)}, ' ...
'pages = {105-115}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MishGanz2006'; type = 'Article'; bib = [ ... 
'author = {Hiroaki Mishina and Benjamin Gonzares and Honorio Pagaliawan and Masato Moteki and Hiroshi Kohno}, ' ... 
'year = {2006}, ' ...
'title = {Reproductive biology of blacktip grouper, \emph{Epinephelus fasciatus}, in {S}ulu {S}ea, {P}hilippines}, ' ...
'journal = {La Mer}, ' ...
'volume = {44}, ' ...
'pages = {23-31}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Epinephelus-fasciatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

