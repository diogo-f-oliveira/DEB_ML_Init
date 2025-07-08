  function [data, auxData, metaData, txtData, weights] = mydata_Distichodus_antonii
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Characiformes'; 
metaData.family     = 'Distichodontidae';
metaData.species    = 'Distichodus_antonii'; 
metaData.species_en = 'Antoni''s distichodus'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author     = {'Bas Kooijman'};                             
metaData.date_subm  = [2022 07 13];                          
metaData.email      = {'bas.kooijman@vu.nl'};                 
metaData.address    = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};   

metaData.curator    = {'Starrlight Augustine'};
metaData.email_cur  = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc   = [2022 07 13]; 

%% set data
% zero-variate data
data.am = 9*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(27); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 33.6;    units.Lp = 'cm';   label.Lp = 'std length at puberty';  bibkey.Lp = 'BertKoua2008';
  comment.Lp = 'Based on same relative length as D.rostratus: 46.5*55/76';
data.Li = 55;    units.Li = 'cm';   label.Li = 'ultimate std length';  bibkey.Li = 'fishbase';
  comment.Li = 'ZebeMich2010 give an asymptotic length of 108 cm';

data.Wwb = 8.8e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'BertKoua2008';
  comment.Wwb = 'based on egg diameter of 1.19 mm of Distichodus rostratus: pi/6*.119^3';
data.Wwi = 2.8e3;  units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01549*Li^3.02, see F2';
  
data.Ri = 5.6e4/365; units.Ri = '#/d'; label.Ri = 'max reprod rate'; bibkey.Ri = 'BertKoua2008';
  temp.Ri = C2K(27); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on 12,004 eggs per kg for Distichodus rostratus: 12e4*2.8/365';
 
% univariate data
% time-length
data.tL = [ ... % time since birth (yr), standard length (cm)
1	18.441
2	26.044
3	34.096
4	42.599
5	47.499];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'standard length'};
temp.tL    = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ZebeMich2010';
comment.tL = 'based on back-calculated lengths';

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

%% Discussion points
D1 = 'Temperatures are guessed';
D2 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Preferred temp: 23-28 C';
metaData.bibkey.F1    = 'fishbase';
F2 = 'Weight (g) = 0.01549*(TL in cm)^3.02';
metaData.bibkey.F2    = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '36XL3'; % Cat of Life
metaData.links.id_ITIS = '640957'; % ITIS
metaData.links.id_EoL = '220123'; % Ency of Life
metaData.links.id_Wiki = 'Distichodus'; % Wikipedia
metaData.links.id_ADW = 'Distichodus_antonii'; % ADW
metaData.links.id_Taxo = '173322'; % Taxonomicon
metaData.links.id_WoRMS = '1019574'; % WoRMS
metaData.links.id_fishbase = 'Distichodus-antonii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Distichodus}}';  
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
bibkey = 'ZebeMich2010'; type = 'Article'; bib = [ ...  
'doi = {10.5897/AJEST09.211}, ' ...
'author = {Victorine Mbadu Zebe and Jean Claude Micha and Jacques Moreau and Mbomba Nseu Bekeli}, ' ...
'year  = {2010}, ' ...
'title = {Age and growth of \emph{Distichodus antonii} ({S}chilthuis, 1891) ({P}isces, {T}eleostei, {D}istichontidae) in {P}ool {M}alebo, {C}ongo {R}iver}, ' ...  
'journal = {African Journal of Environmental Science and Technology}, ' ...
'volume = {4(5)}, ' ...
'pages = {279-283}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BertKoua2008'; type = 'Article'; bib = [ ...  
'author = {S. Bert\''{e} and E.P. Kouam\''{e}lan and N.I. Ouattara and T. Kon\''{e} and B.G. Goore and V. N''Douba and N.J. Kouassi}, ' ...
'year  = {2008}, ' ...
'title = {Cycle de reproduction et f\''{e}condit\''{e} de \emph{Distichodus rostratus} ({C}haraciformes, {D}istichodontidae) dans un bassin ouest africain (fleuve {B}andama, {C}\circ{o}te d''{I}voire)}, ' ...  
'journal = {Tropicultura}, ' ...
'volume = {26(2)}, ' ...
'pages = {104-107}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Distichodus-antonii.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

