function [data, auxData, metaData, txtData, weights] = mydata_Pseudotolithus_typus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Pseudotolithus_typus'; 
metaData.species_en = 'Longneck croaker'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0jMp', '0jMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25.7); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 15];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 15];

%% set data
% zero-variate data


data.am = 10*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';   
  temp.am = C2K(25.7); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 48.3;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';bibkey.Lp  = 'fishbase'; 
data.Li  = 140;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 1.08e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'EkanAchi2004';
  comment.Wwb = 'based on egg diameter of 0.59 mm: pi/6*0.059^3';
data.Wwp = 940;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
 comment.Wwp = 'based on 0.00661*Lp^3.06, see F1';
data.Wwi = 24398;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
 comment.Wwi = 'based on 0.00661*Li^3.06, see F1; max published weight 15 kg';

data.Ri = 140946/365;  units.Ri = '#/d';  label.Ri = 'reprod rate at TL 36 cm';  bibkey.Ri = 'SyllTia2016';
  temp.Ri = C2K(25.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Pseudotolithus_senegalensis';
 
% uni-variate data
% time-length
data.tL = [ ... % yr class (yr), total length (cm)
    1 14.0
    2 25.1
    3 38.2
    4 46.2
    5 50.8
    6 54.5];
data.tL(:,1) = (.5 + data.tL(:,1)) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(25.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Erzi1991'; comment.tL = 'record 371';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;
weights.Ri = 5 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

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
F1 = 'weight-length relationship: Ww in g  = 0.00661*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4PDQW'; % Cat of Life
metaData.links.id_ITIS = '646553'; % ITIS
metaData.links.id_EoL = '46578930'; % Ency of Life
metaData.links.id_Wiki = 'Pseudotolithus'; % Wikipedia
metaData.links.id_ADW = 'Pseudotolithus_typus'; % ADW
metaData.links.id_Taxo = '185340'; % Taxonomicon
metaData.links.id_WoRMS = '127009'; % WoRMS
metaData.links.id_fishbase = 'Pseudotolithus-typus'; % fishbase

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
bibkey = 'Erzi1991'; type = 'techreport'; bib = [ ... 
'author = {Erzini, K.}, ' ... 
'year = {1991}, ' ...
'title = {A compilation of data on variability in length-age in marine fishes}, ' ...
'institution = {Fisheries Stock Assessment, Title XII, Collaborative Research Support Program, University of Rhode Island}, ' ...
'volume = {Working paper 77}, ' ...
'pages = {1-36}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SyllTia2016'; type = 'article'; bib = [ ... 
'doi = {10.7755/FB.112.2-3.6}, ' ... 
'author = {Souma\"{i}la Sylla and Christian Bernard Tia and Kouadio Fr\''{e}deric Kouakou and Amoin C\''{e}line Kouame and Paul Ess\''{e}tchi Kouamelan and Boua C\''{e}lestin Atse}, ' ... 
'year = {2016}, ' ...
'title = {Aspect of reproductive biology of the cassava croaker, \emph{Pseudotolithus senegalensis} ({V}alenciennes, 1833) of {I}vory coast continental shelf} , ' ...
'journal = {Scientific Journal of Biological Sciences}, ' ...
'volume = {1125(7))}, ' ...
'pages = {167-173}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Pseudotolithus-typus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

