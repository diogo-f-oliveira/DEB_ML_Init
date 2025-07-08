  function [data, auxData, metaData, txtData, weights] = mydata_Sander_lucioperca
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Percidae';
metaData.species    = 'Sander_lucioperca'; 
metaData.species_en = 'European pike-perch'; 

metaData.ecoCode.climate = {'Cfa', 'Dfc', 'Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr', '0iFl', '0iFe'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'piCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'; 'T-ab'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2017 08 17];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 08 17]; 

%% set data
% zero-variate data
data.tp = 4*365;      units.tp = 'd';  label.tp = 'age at puberty for females';    bibkey.tp = 'Aart2007';
  temp.tp = C2K(16); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 3.5*365;      units.tpm = 'd';  label.tpm = 'age at puberty for males';    bibkey.tpm = 'Aart2007';
  temp.tpm = C2K(16); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 16*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'Aart2007';   
  temp.am = C2K(16); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 40;  units.Lp = 'cm'; label.Lp = 'total length at puberty for females';  bibkey.Lp = 'Aart2007'; 
data.Lpm = 35;  units.Lpm = 'cm'; label.Lpm = 'total length at puberty for males';  bibkey.Lpm = 'Aart2007'; 
data.Li = 120;    units.Li = 'cm'; label.Li = 'ultimate total length';              bibkey.Li = 'Aart2007';

data.Wwb = 3.8e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';              bibkey.Wwb = 'Aart2007';
  comment.Wwb = 'Based on egg diameter of 0.9 mm: 4/3*pi*0.045^3';
data.Wwp = 741;  units.Wwp = 'g'; label.Wwp = 'wet weight at puberty for females';  bibkey.Wwp = 'Aart2007'; 
  comment.Wwp = 'Based on  (Lp/Li)^3 * Wwi';
data.Wwpm = 496;  units.Wwpm = 'g'; label.Wwpm = 'wet weight at puberty for males';  bibkey.Wwpm = 'Aart2007'; 
  comment.Wwpm = 'Based on (Lpm/Li)^3 * Wwi';
data.Wwi = 20e3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';               bibkey.Wwi = 'Aart2007';

data.Ri = 4e6/365;   units.Ri = '#/d';  label.Ri = 'Reprod rate max size';           bibkey.Ri = 'Aart2007';
  temp.Ri = C2K(16); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '200 eggs per g';

% univariate data

% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
 1 13.8
 2 24.8
 3 35.2
 4 44.2
 5 52.1
 6 57.0
 7 63.5
 8 67.7
 9 73.2
10 76.3];
data.tL(:,1) = 365 * data.tL(:,1);  % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(16);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Aart2007';
comment.tL = 'Data from LakeIvosjon, Sweden';

% length-weight
data.LW = [ ... % total length (cm), wet weight (g)
9.888	50.526
19.888	67.368
29.774	252.632
39.659	538.947
49.762	1145.263
59.861	1987.368
69.733	3250.526
79.820	4951.579
89.677	7225.263];
units.LW = {'cm', 'g'}; label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'Aart2007';

% temperature-incubation time
data.Tab = [ ... % temperature (C), incubation time (d)
10 11
13 10
15  5
18  4];
units.Tab= {'C', 'd'}; label.Tab = {'temperature', 'incubation time'};  
bibkey.Tab = 'Aart2007';

%% set weights for all real data
weights = setweights(data, []);
weights.Tab = 3 * weights.Tab;
weights.tL = 3 * weights.tL;
weights.Wwb = 3 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = weights.psd.v * 2;
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '6XHMB'; % Cat of Life
metaData.links.id_ITIS = '650172'; % ITIS
metaData.links.id_EoL = '46580134'; % Ency of Life
metaData.links.id_Wiki = 'Sander_lucioperca'; % Wikipedia
metaData.links.id_ADW = 'Sander_lucioperca'; % ADW
metaData.links.id_Taxo = '186511'; % Taxonomicon
metaData.links.id_WoRMS = '151308'; % WoRMS
metaData.links.id_fishbase = 'Sander-lucioperca'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Sander_lucioperca}}';  
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
bibkey = 'Aart2007'; type = 'Techreport'; bib = [ ...  
'author = {Aarts, T. W. P. M.}, ' ...
'year = {2007}, ' ...
'title = {Kennisdocument snoekbaars, \emph{Sander lucioperca} ({L}innaeus, 1758)}, ' ... 
'institution = {Sportvisserij Nederland}, ' ...
'series = {Kennisdocument}, ' ...
'volume = {16}, '...
'howpublished = {\verb+\url{https://www.sportvisserijnederland.nl/files/kennisdocument_snoekbaars_4560.pdf}+}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
