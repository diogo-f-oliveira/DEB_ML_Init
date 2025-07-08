function [data, auxData, metaData, txtData, weights] = mydata_Pagrus_caeruleostictus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Pagrus_caeruleostictus'; 
metaData.species_en = 'Bluespotted seabream'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE','MAm'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'jiHa'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 12 08];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 08];

%% set data
% zero-variate data

data.ab = 8;      units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'guess';   
  temp.ab = C2K(17.5); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Diplodus puntazzo';
data.am = 17*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';   
  temp.am = C2K(17.5); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Dentex dentex';

data.Lp  = 18.7;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase';  
data.Li  = 90;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.85 mm of Diplodes sargus: pi/6*0.085^3';
data.Wwp = 112;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based in 0.02042*Lp^2.94, see F1';
data.Wwi = 11364;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based in 0.02042*Li^2.94, see F1';

data.GSI  = 0.05; units.GSI  = '-'; label.GSI  = 'gonado-somatic index'; bibkey.GSI = 'guess';   
  temp.GSI = C2K(17.5); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
395.864	6.254
365+64.412	6.148
365+303.272	9.223
365+394.522	9.859
730+63.070	9.965
730+152.978	11.343
730+183.842	11.555
730+210.680	11.343
730+245.570	11.343
730+275.092	12.509
730+304.614	12.721
1095+92.592	14.311
1095+120.772	13.887
1095+182.500	14.417
1095+244.228	15.159
1095+276.434	16.113
1095+303.272	16.007
1095+336.820	16.007
1095+363.658	15.477
1460+67.096	18.763
1460+120.772	19.293
1460+150.294	19.717
1460+182.500	19.505
1460+391.838	20.883];
data.tL(:,1) = 20 + data.tL(:,1); % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(17.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'AmpoAsie2023';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 10 * weights.Li;
weights.Wwi = 3 * weights.Wwi;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.02042*(TL in cm)^2.94';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4BZN3'; % Cat of Life
metaData.links.id_ITIS = '647902'; % ITIS
metaData.links.id_EoL = '46579971'; % Ency of Life
metaData.links.id_Wiki = 'Pagrus'; % Wikipedia
metaData.links.id_ADW = 'Pagrus_caeruleostictus'; % ADW
metaData.links.id_Taxo = '182495'; % Taxonomicon
metaData.links.id_WoRMS = '127062'; % WoRMS
metaData.links.id_fishbase = 'Pagrus-caeruleostictus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pagrus}}';
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
bibkey = 'AmpoAsie2023'; type = 'Article'; bib = [ ... 
'author = {Amponsah, S. and B. Asiedu and N.C. Amarquaye and E. Ofori-Boateng and N.A. Afranewaa and S. Henneh}, ' ... 
'year = {2023}, ' ...
'title = {Population dynamics of seabreams (\emph{Pagrus caeruleostictus}, \emph{Pagellus bellottii}, \emph{Dentex angolensis} and \emph{Dentex congoensis}) from the coast of {G}hana, {W}est {A}frica}, ' ...
'journal = {Journal of Marine Sciences and Fisheries}, ' ...
'volume = {6(1)}, ' ...
'pages = {24-32}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Pagrus-caeruleostictus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
