function [data, auxData, metaData, txtData, weights] = mydata_Ptychocheilus_grandis

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Ptychocheilus_grandis'; 
metaData.species_en = 'Sacramento pikeminnow'; 

metaData.ecoCode.climate = {'Csa','Dsb','Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr','0iFp'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi','jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
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

data.tp = 3 * 365;   units.tp = 'd';  label.tp = 'time since birth at puberty';  bibkey.tp = 'guess';   
  temp.tp = C2K(16); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'Data for P.lucius';
data.am = 9*365;   units.am = 'd';  label.am = 'life span';                      bibkey.am = 'fishbase';   
  temp.am = C2K(16); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Li = 140;    units.Li = 'cm'; label.Li = 'ultimate total length';           bibkey.Li = 'Wiki'; 
  
data.Wwb = 3.4e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'Insl1983';
  comment.Wwb = 'based on egg diameter of 1.86 mm for P.lucius: pi/6*0.186^3';
data.Wwi = 17.8e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00650*Li^3, see F1';

data.R50 = 17730/365;   units.R50 = '#/d';  label.R50 = 'Reproduction rate at SL 50 cm';  bibkey.R50 = 'explorer';   
  temp.R50 = C2K(16); units.temp.R50 = 'K'; label.temp.R50 = 'temperature';

%% univariate data
 
% time-length
data.tL = [ ... % days post hatch, standard length (cm)
 1  6.5
 2 14.4
 3 20.1
 4 25.6
 5 26.2
 6 30.3];
data.tL(:,1) = 365 * (0 + data.tL(:,1));
data.tL(:,2) = data.tL(:,2)/ 0.85;
units.tL = {'d', 'cm'}; label.tL = {'time since hatch', 'total length'};  
temp.tL = C2K(16);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Brow1990'; 
comment.tL = 'Data from Bear Creek, Colusa., California, converted from SL using F2';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 3 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight: W in g = 0.00650*(TL in cm)^3';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL =  0.85*TL';
metaData.bibkey.F2 = 'Wiki';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '4Q9YG'; % Cat of Life
metaData.links.id_ITIS = '163524'; % ITIS
metaData.links.id_EoL = '210297'; % Ency of Life
metaData.links.id_Wiki = 'Ptychocheilus_grandis'; % Wikipedia
metaData.links.id_ADW = 'Ptychocheilus_grandis'; % ADW
metaData.links.id_Taxo = '185521'; % Taxonomicon
metaData.links.id_WoRMS = '1021495'; % WoRMS
metaData.links.id_fishbase = 'Ptychocheilus-grandis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Ptychocheilus_grandis}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Ptychocheilus-grandis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'explorer'; type = 'Misc'; bib = ...
'howpublished = {\url{https://explorer.natureserve.org/Taxon/ELEMENT_GLOBAL.2.102402/Ptychocheilus_grandis}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'Brow1990'; type = 'article'; bib = [ ... 
'author = {Larry R. Brown}, ' ...
'year = {1990}, ' ...
'title  = {Age, Growth, Feeding, and Behavior of {S}acramento Squawfish (\emph{Ptychocheilus grandis}) in {B}ear {C}reek, {C}olusa {C}o., {C}alifornia}, ' ...
'journal = {The Southwestern Naturalist}, ' ...
'pages = {249-260}, ' ...
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
bibkey = 'Insl1983'; type = 'techreport'; bib = [ ... 
'howpublished = {\url{https://www.nativefishlab.net}}, ' ...
'author = {Theophilus D. Inslee}, ' ...
'year = {1983}, ' ...
'title  = {SPAWNING AND HATCHING OF THE COLORADO SQUAWFISH (\emph{Ptychocheilus lucius})}, ' ...
'institution = {U.S. Fish and Wildlife Service P.O. Box 217 Dexter, New Mexico 88230}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

