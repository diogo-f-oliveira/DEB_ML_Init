  function [data, auxData, metaData, txtData, weights] = mydata_Etheostoma_gracile
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Percidae';
metaData.species    = 'Etheostoma_gracile'; 
metaData.species_en = 'Slough darter'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr', '0iFc'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 07 05];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 07 05]; 

%% set data
% zero-variate data
data.tp = 0.5*365;   units.tp = 'd';  label.tp = 'time since birth at puberty';     bibkey.tp = 'BraaSmit1967';   
  temp.tp = C2K(21); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on mature at 1 yr';
data.am = 4.5*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'BraaSmit1967';   
  temp.am = C2K(21); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 3.9;  units.Lp = 'cm'; label.Lp = 'standard length at puberty';  bibkey.Lp = 'BraaSmit1967'; 
data.Li = 5.1;   units.Li = 'cm'; label.Li = 'ultimate standard length';  bibkey.Li = 'fishbase';
  comment.Li = 'based on TL 6 cm and F1';

data.Wwb = 3.2e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'BraaSmit1967';
  comment.Wwb = 'based on egg diameter of 0.85 mm: pi/6*0.085^3';
data.Wwi = 1.42;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00513*6^3.14, see F1, F2';
 
data.Ri = 500/365;units.Ri = '#/d'; label.Ri = 'maximum reprod rate';    bibkey.Ri = 'BraaSmit1967';   
  temp.Ri = C2K(21);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on remark that 2500 eggs are produced, but only 20% reach mature size';
  
% univariate data
% time-length
data.tL = [ ... % time since birth (yr), std length (cm)
1.752	1*7
1.911	2*7
2.059	3*7
2.124	4*7
2.213	6*7
2.267	8*7
2.500	10*7
2.693	13*7
2.797	17*7
2.946	22*7
3.049	27*7
3.172	1*365
3.553	2*365
3.800	3*365
4.003	4*365];
data.tL = data.tL(:,[2 1]);  % convert Lt to tL
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(21);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BraaSmit1967';

%% set weights for all real data
weights = setweights(data, []);
weights.tL =  3 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v =  2 * weights.psd.v;
weights.psd.p_M =  5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Mean temperature is guessed, but varied between 0 and 27 C';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-length from photo: SL = 0.85 * TL';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-weight: Ww in g = 0.00513*(TL in cm)^3.14 ';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3BL44'; % Cat of Life
metaData.links.id_ITIS = '168366'; % ITIS
metaData.links.id_EoL = '213362'; % Ency of Life
metaData.links.id_Wiki = 'Etheostoma_gracile'; % Wikipedia
metaData.links.id_ADW = 'Etheostoma_gracile'; % ADW
metaData.links.id_Taxo = '174101'; % Taxonomicon
metaData.links.id_WoRMS = '1419851'; % WoRMS
metaData.links.id_fishbase = 'Etheostoma-gracile'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Etheostoma_gracile}}';  
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
bibkey = 'BraaSmit1967'; type = 'Techreport'; bib = [ ... 
'author = {Marvin E. Braasch and Philip W. Smith}, ' ...
'year = {1967}, ' ...
'title = {The life history of the slough darter, \emph{Etheostoma gracile}, ({P}isces, {P}ercidae}, ' ... 
'institution = {Dept Energy and Natural Resources; Illinois Institute for Natural Resources}, ' ...
'series = {Biological notes}, ' ...
'volume = {58}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Etheostoma-gracile.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
