function [data, auxData, metaData, txtData, weights] = mydata_Ptychocheilus_oregonensis

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Ptychocheilus_oregonensis'; 
metaData.species_en = 'Northern pikeminnow'; 

metaData.ecoCode.climate = {'Csa','Csb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFl','0iFp'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi','jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 07 18];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 07 18]; 

%% set data
% zero-variate data

data.ab = 10;   units.ab = 'd';  label.ab = 'age at birth';  bibkey.ab = 'Beam1992';   
  temp.ab = C2K(21); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 5 * 365;   units.tp = 'd';  label.tp = 'time since birth at puberty';  bibkey.tp = 'Beam1992';   
  temp.tp = C2K(16); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 17*365;   units.am = 'd';  label.am = 'life span';                    bibkey.am = 'Garc2014';   
  temp.am = C2K(16); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 26.5/0.94;    units.Lp = 'cm'; label.Lp = 'total length at puberty';    bibkey.Lp = 'Beam1992'; 
data.Li = 63;    units.Li = 'cm'; label.Li = 'ultimate total length';           bibkey.Li = 'Wiki'; 
  
data.Wwb = 0.0103;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';         bibkey.Wwb = 'Garc2014';
  comment.Wwb = 'based on egg diameter of 2.7 mm: pi/6*0.27^3';
data.Wwi = 2.4e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01020*Li^2.986, see F1. Fishbase gives 13 kg, but this is at odds with Li';

data.Ri = 25000/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate';  bibkey.Ri = 'Garc2014';   
  temp.Ri = C2K(16); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

%% univariate data
 
% time-length
data.tL = [ ... % days post hatch, total length (cm)
0.456	0.959
22.585	1.634
61.355	2.677
98.491	2.985
253.936	2.973
311.423	3.690
365.958	4.917];
units.tL = {'d', 'cm'}; label.tL = {'time since hatch', 'total length'};  
temp.tL = C2K(16);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Beam1992'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.tp = 0 * weights.tp;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperature in tL data is assumed to vary as T(t)=11+9*cos(t*2*pi/365) in C';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: W in g = 0.01020*(TL in cm)^2.986';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL=0.85*TL; FL=0.94*TL';
metaData.bibkey.F2 = 'Wiki';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '4Q9YN'; % Cat of Life
metaData.links.id_ITIS = '163523'; % ITIS
metaData.links.id_EoL = '210298'; % Ency of Life
metaData.links.id_Wiki = 'Ptychocheilus_oregonensis'; % Wikipedia
metaData.links.id_ADW = 'Ptychocheilus_oregonensis'; % ADW
metaData.links.id_Taxo = '185522'; % Taxonomicon
metaData.links.id_WoRMS = '592844'; % WoRMS
metaData.links.id_fishbase = 'Ptychocheilus-oregonensis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Ptychocheilus_oregonensis}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Ptychocheilus-oregonensis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'explorer'; type = 'Misc'; bib = ...
'howpublished = {\url{https://explorer.natureserve.org/Taxon/ELEMENT_GLOBAL.2.102402/Ptychocheilus_grandis}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'Beam1992'; type = 'article'; bib = [ ... 
'author = {Raymond C. Beamesderfer}, ' ...
'year = {1992}, ' ...
'title  = {Reproduction and early life history of northern squawfish, \emph{Ptychocheilus oregonensis}, in {I}daho''s {S}t. {J}oe {R}iver}, ' ...
'journal = {Environmental Biology of Fishes}, ' ...
'pages = {231-241}, ' ...
'volume = {35}, ' ...
'number = {3}'];
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
bibkey = 'Garc2014'; type = 'techreport'; bib = [ ... 
'author = {Adan Martinez Garcia}, ' ...
'year = {2014}, ' ...
'title  = {Invasive Species of the {P}acific {N}orthwest: Northern Pikeminnow, \emph{Ptychocheilus oregonensis}}, ' ...
'series = {FISH 423: Julian Olden}, ' ...
'institution = {U.S. Fish and Wildlife Service}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

