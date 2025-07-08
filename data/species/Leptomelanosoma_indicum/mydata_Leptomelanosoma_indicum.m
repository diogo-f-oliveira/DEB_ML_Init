function [data, auxData, metaData, txtData, weights] = mydata_Leptomelanosoma_indicum
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Polynemiformes'; 
metaData.family     = 'Polynemidae';
metaData.species    = 'Leptomelanosoma_indicum'; 
metaData.species_en = 'Indian threadfin'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'piCvf'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2017 04 16]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 04 16]; 

%% set data
% zero-variate data

data.am = 10*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 20; units.Lp  = 'cm';  label.Lp  = 'fork length at puberty'; bibkey.Lp  = 'guess'; 
  comment.Lp = 'guess based on maturity as male at 0.5 yr in Polydactylus sexfilis';
data.Li  = 142;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 2.5e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'ctsa';
  comment.Wwb = 'based egg diameter of 0.775 mm: 4/3*pi*0.039^3'; 
data.Wwi = 21213; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00389 * Li^3.13, see F1';

data.Ri = 1.5e6/365;  units.Ri = '#/d';  label.Ri = 'reprod rate';  bibkey.Ri = 'KamLeun2002';
  temp.Ri = C2K(28); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on 7e4 eggs/kg for Polydactylus sexfilis and Wwi = 21.2 kg';

% uni-variate data
% t-L data 
data.tL = [ ... % time since birth (yr), fork length (cm)
1  34.5
2  54.5
3  74.5
4  84.5
5  94.6
6 104.5];
data.tL(:,1) = 365 * data.tL(:,1);  % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Kadw1971';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'weight-length relationship: W = 0.00389 * TL^3.13';
metaData.bibkey.F1 = ''; 
F2 = 'Marine; brackish; demersal; amphidromous; depth range 55 - 100 m.   Tropical';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'protandrous hermaphrodite (first male, then female) in family member Pacific Threadfin, Polydactylus sexfilis';
metaData.bibkey.F3 = 'ctsa'; 
metaData.facts = struct('F1',F1,'F2',F2, 'F3', F3);

%% Links
metaData.links.id_CoL = '3TR6W'; % Cat of Life
metaData.links.id_ITIS = '645490'; % ITIS
metaData.links.id_EoL = '46578875'; % Ency of Life
metaData.links.id_Wiki = 'Leptomelanosoma_indicum'; % Wikipedia
metaData.links.id_ADW = 'Leptomelanosoma_indicum'; % ADW
metaData.links.id_Taxo = '691213'; % Taxonomicon
metaData.links.id_WoRMS = '281323'; % WoRMS
metaData.links.id_fishbase = 'Leptomelanosoma-indicum'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Leptomelanosoma_indicum}}';
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
bibkey = 'Kadw1971'; type = 'Article'; bib = [ ... 
'author = {Kadwade, P. V.}, ' ... 
'year = {1971}, ' ...
'title = {Age and growth of \emph{Polydactylus indicus} ({S}haw)}, ' ...
'journal = {Indian Journal of fisheries}, ' ...
'volume = {18}, ' ...
'pages = {165--169}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KamLeun2002'; type = 'Article'; bib = [ ... 
'author = {L. E. Kam and P. Leung}, ' ... 
'year = {2002}, ' ...
'title = {Size Economies of a {P}acific Threadfin \emph{Polydactylus sexfilis} Hatchery in {H}awaii}, ' ...
'journal = {Journal of the World Aquaculture Society}, ' ...
'volume = {33}, ' ...
'pages = {165--169}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/Summary/SpeciesSummary.php?ID=4469&genusname=Leptomelanosoma&speciesname=indicum&AT=POLYDACTYLUS+INDICUS&lang=English}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ctsa'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.ctsa.org/files/publications/MoiManual.pdf}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];