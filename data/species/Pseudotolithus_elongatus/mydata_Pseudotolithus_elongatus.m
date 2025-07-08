function [data, auxData, metaData, txtData, weights] = mydata_Pseudotolithus_elongatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Pseudotolithus_elongatus'; 
metaData.species_en = 'Bobo croaker'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0jMp', '0jMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 08];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 08];

%% set data
% zero-variate data


data.am = 10*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 19.1;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';bibkey.Lp  = 'fishbase'; 
data.Li  = 62.5;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 1.08e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'EkanAchi2004';
  comment.Wwb = 'based on egg diameter of 0.59 mm: pi/6*0.059^3';
data.Wwp = 57;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
 comment.Wwp = 'based on 0.00646*Lp^3.08, see F1';
data.Wwi = 2.2e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
 comment.Wwi = 'based on 0.00646*Li^3.08, see F1';

data.Ri = 2e6/365;  units.Ri = '#/d';  label.Ri = 'reprod rate at TL 29.5 cm';  bibkey.Ri = 'EkanAchi2004';
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
 
% uni-variate data
% time-length
data.tL = [ ... % yr class (yr), total length (cm)
    1 13.5
    2 18.0
    3 25.0
    4 31.5
    5 36.0
    6 39.0];
data.tL(:,1) = (.75 + data.tL(:,1)) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'RomoHerz2015';
comment.tL = 'Data from several locations';

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

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'weight-length relationship: Ww in g  = 0.00646*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; brackish; demersal. Tropical';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = 'JJR6'; % Cat of Life
metaData.links.id_ITIS = '646550'; % ITIS
metaData.links.id_EoL = '46578931'; % Ency of Life
metaData.links.id_Wiki = 'Pseudotolithus'; % Wikipedia
metaData.links.id_ADW = 'Pseudotolithus_elongatus'; % ADW
metaData.links.id_Taxo = '185335'; % Taxonomicon
metaData.links.id_WoRMS = '273784'; % WoRMS
metaData.links.id_fishbase = 'Pseudotolithus-elongatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pseudotolithus}}';
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
bibkey = 'Nawa1985'; type = 'article'; bib = [ ...
'author = {Nawa, I.G}, ' ...
'year = {1985}, ' ...
'title = {A study on the growth of \emph{Pseudotolithus elongatus}, \emph{Chrysichthys nigrodigitatus} and \emph{Cynoglossus goreensis} occurring in the {C}ross {R}iver {E}stuary}, ' ... 
'journal = {Aquadocs}, ' ...
'howpublished = {\url{http://hdl.handle.net/1834/21143}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EkanAchi2004'; type = 'article'; bib = [ ...
'author = {Sunday Ben Ekanem and Marilym-Joan Achima and Mfon Michael Ekere}, ' ...
'year = {2004}, ' ...
'title = {Studies on some reproductive aspects of \emph{Pseudotolithus elongatus} in the {C}ross {R}iver estuary, {N}igeria}, ' ... 
'journal = {Sci. Mar.}, ' ...
'volume = {68(2)},', ...
'pages = {265-271}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Pseudotolithus-elongatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

