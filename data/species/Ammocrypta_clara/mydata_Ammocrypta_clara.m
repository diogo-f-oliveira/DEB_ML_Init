  function [data, auxData, metaData, txtData, weights] = mydata_Ammocrypta_clara
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Percidae';
metaData.species    = 'Ammocrypta_clara'; 
metaData.species_en = 'Western sand darter';

metaData.ecoCode.climate = {'Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr', '0iFc'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp

metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 08 18];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 18]; 

%% set data
% zero-variate data
data.am = 4*365;   units.am = 'd';  label.am = 'life span';                     bibkey.am = 'DrakPowe2008';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Ammocrypta pellucida';

data.Lp = 4.5;  units.Lp = 'cm'; label.Lp = 'standard length at puberty for females';  bibkey.Lp = 'fishesoftexas'; 
  comment.Lp = 'based on SL 3.9 cm of A. vivax';
data.Li = 8.2;    units.Li = 'cm'; label.Li = 'ultimate total length';             bibkey.Li = 'fishesoftexas';
  comment.Li = 'based on  SL 7.0 cm';

data.Wwb = 5.2e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishesoftexas';
  comment.Wwb = 'based on egg diameter of 1 mm : pi/6*0.1^3';
data.Wwp = 0.58; units.Wwp = 'g';  label.Wwp = 'wet weight at puberty'; bibkey.Wwp = {'fishbase','fishesoftexas'};
  comment.Wwp = 'based on 0.00513*Lp^3.14, see F1';
data.Wwi = 3.8; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight'; bibkey.Wwi = {'fishbase','fishesoftexas'};
  comment.Wwi = 'based on 0.00513*Li^3.14, see F1';

data.Ri = 324/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate';   bibkey.Ri = 'fishesoftexas';
  temp.Ri = C2K(22); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length
data.tL = [ ... % time  (yr), total length (cm)
0 4.4
1 5.6
2 6.1];
data.tL(:,1) = 365 * (0.9 + data.tL(:,1));  % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(22);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'fishesoftexas';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = weights.psd.v * 5;

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
F1 = 'length-weight: Ww in g = 0.00513*(TL in cm)^3.14';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from Photo: SL = 0.85 * TL';
metaData.bibkey.F2 = 'fishesoftexas'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'CTHR'; % Cat of Life
metaData.links.id_ITIS = '168515'; % ITIS
metaData.links.id_EoL = '206896'; % Ency of Life
metaData.links.id_Wiki = 'Ammocrypta_clara'; % Wikipedia
metaData.links.id_ADW = 'Ammocrypta_clara'; % ADW
metaData.links.id_Taxo = '160638'; % Taxonomicon
metaData.links.id_WoRMS = '1019836'; % WoRMS
metaData.links.id_fishbase = 'Ammocrypta-clara'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Ammocrypta_clara}}';  
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
bibkey = 'DrivDam2013'; type = 'article'; bib = [ ...
'author = {Lucas J. Driver and Ginny L. Adams}, ' ...
'year = {2013}, ' ...
'title = {Life History and Spawning Behavior of the Western Sand Darter (\emph{Ammocrypta clara}) in {N}ortheast {A}rkansas}, ' ... 
'journal = {The American Midland Naturalist}, ' ...
'volume = {170}, '...
'pages = {199-212}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Ammocrypta-clara.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishesoftexas'; type = 'Misc'; bib = ...
'howpublished = {\url{http://txstate.fishesoftexas.org/ammocrypta vivax.htm}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WallYeag1990'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Robert Wallus and Bruce L. Yeager and Thomas P. Simon}, ' ...
'year = {1990}, ' ...
'title  = {The reproductive biology and early life history of fishes of the Ohio river}, ' ...
'publisher = {Tennessee Valley Authority}, ' ...
'volume  = {4}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DrakPowe2008'; type = 'article'; bib = [ ...
'doi = {10.1139/Z08-037}, ' ...
'author = {D.A.R. Drake and M. Power and M. A. Koops and S. E. Doka and N. E. Mandrak}, ' ...
'year = {2008}, ' ...
'title = {Environmental factors affecting growth of eastern sand darter (\emph{Ammocrypta pellucida})}, ' ... 
'journal = {Can. J. Zool.}, ' ...
'volume = {86}, '...
'pages = {714-722}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


