function [data, auxData, metaData, txtData, weights] = mydata_Iotichthys_phlegethontis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Iotichthys_phlegethontis'; 
metaData.species_en = 'Least chub'; 

metaData.ecoCode.climate = {'BWk'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr','jiFc'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpO'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 09 15];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 09 15]; 

%% set data
% zero-variate data

data.am = 7*365;   units.am = 'd';  label.am = 'life span';                      bibkey.am = 'MillBelk2004';   
  temp.am = C2K(13); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 2.5;    units.Lp = 'cm'; label.Lp = 'total length at puberty';           bibkey.Lp = 'HankBelk2004';
  comment.Lp = 'based on FL 6.5 cm';
data.Li = 6.4;    units.Li = 'cm'; label.Li = 'ultimate total length';             bibkey.Li = 'fishbase'; 
  
data.Wwb = 5.2e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'HankBelk2004';
  comment.Wwb = 'based on egg diameter of 0.75 - 1.25 mm for Lepidomeda aliciae: pi/6*0.1^3';
data.Wwp = 0.147;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';         bibkey.Wwp = {'fishbase','HankBelk2004'};
  comment.Wwp = 'based on 0.00891*Lp^3.06, F1';
data.Wwi = 2.61;   units.Wwi = 'g';  label.Wwi = 'wet weight at birth';         bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00891*Li^3.06, F1';

data.Ri = 2700/365; units.Ri = '#/d';  label.Ri = 'reprod rate at SL 92 mm, TL 108 mm';  bibkey.Ri = 'HankBelk2004';
  temp.Ri = C2K(13); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'value for Lepidomeda aliciae';

% univariate data
% time-length
data.tL = [ ... % time (yr) std length (cm)
0.941	1.517
2.008	2.986
3.059	3.906
4.054	4.292
5.016	3.893
6.011	4.185];
data.tL(:,1) = 365 * (0.3 + data.tL(:,1));
data.tL(:,2) = data.tL(:,2)/ 0.83; % convert FL to TL
units.tL = {'d', 'cm'}; label.tL = {'time since hatch', 'total length'};  
temp.tL = C2K(13);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MillBelk2004'; 
comment.tL = 'Data from Gandy Marsh';

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
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00891*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL = 0.83 * TL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '6N99K'; % Cat of Life
metaData.links.id_ITIS = '163567'; % ITIS
metaData.links.id_EoL = '216709'; % Ency of Life
metaData.links.id_Wiki = 'Iotichthys_phlegethontis'; % Wikipedia
metaData.links.id_ADW = 'Iotichthys_phlegethontis'; % ADW
metaData.links.id_Taxo = '177562'; % Taxonomicon
metaData.links.id_WoRMS = '1020423'; % WoRMS
metaData.links.id_fishbase = 'Iotichthys-phlegethontis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Iotichthys_phlegethontis}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Iotichthys-phlegethontis.html}}';  
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
bibkey = 'MillBelk2004'; type = 'article'; bib = [ ...  
'author = {Michael D. Mills and Mark C. Belk and Russell B. Rader and Joshua E. Brown}, ' ...
'year = {2004}, ' ...
'title  = {Age and growth of least chub, \emph{Iotichthys phlegethontis}, in wild populations}, ' ...
'journal = {Western North American Naturalist}, ' ...
'pages = {409-412}, ' ...
'volume = {64(3)}' ];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%  
bibkey = 'BillWagn2007'; type = 'article'; bib = [ ... 
'doi = {10.1577/A05-100.1}, ' ...
'author = {Eric J. Billman and Eric J. Wagnerand and Ronney E. Arndt}, ' ...
'year = {2007}, ' ...
'title  = {Least Chub Reproduction: Effects of Density, Sex Ratio, and Spawning Substrate Transfer Frequency}, ' ...
'journal = {American Journal of Aquaculture}, ' ...
'pages = {16-21}, ' ...
'volume = {69(1)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%  
bibkey = 'HankBelk2004'; type = 'article'; bib = [ ... 
'author = {Joseph H. Hanks and Mark C. Belk}, ' ...
'year = {2004}, ' ...
'title  = {Threatened fishes of the world: \emph{Iotichthys phlegethontis} {C}ope, 1874 ({C}yprinidae)}, ' ...
'journal = {Environmental Biology of Fishes}, ' ...
'pages = {378}, ' ...
'volume = {71}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
