  function [data, auxData, metaData, txtData, weights] = mydata_Gobio_gobio

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Gobio_gobio'; 
metaData.species_en = 'Gudgeon'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr', '0iFc'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2017 08 15];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 08 15]; 

%% set data
% zero-variate data
data.ah = 9;        units.ah = 'd';  label.ah = 'age at hatch';                   bibkey.ah = 'Beer2005'; 
  temp.ah = C2K(16); units.temp.ah = 'K'; label.temp.ah = 'temperature';
  comment.ah = 'All temps are guessed';
data.ab = 15;        units.ab = 'd';  label.ab = 'age at birth';                   bibkey.ab = 'Beer2005'; 
  temp.ab = C2K(16); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 2.5*365;      units.tp = 'd';  label.tp = 'age at puberty for females';    bibkey.tp = 'Beer2005';
  temp.tp = C2K(16); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 2*365;     units.tpm = 'd';  label.tpm = 'age at puberty for males';    bibkey.tpm = 'Beer2005';
  temp.tpm = C2K(16); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 8*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'fishbase';   
  temp.am = C2K(16); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 0.6;  units.Lb = 'cm'; label.Lb = 'total length at birth';  bibkey.Lb = 'Beer2005'; 
data.Lp = 8.5;  units.Lp = 'cm'; label.Lp = 'total length at puberty for females';  bibkey.Lp = 'Beer2005'; 
  comment.Lp = 'Based on 7.9 cm fork length: 7.9 * 200/185, based on photo';
data.Lpm = 7.5;  units.Lpm = 'cm'; label.Lpm = 'total length at puberty for males'; bibkey.Lpm = 'Beer2005'; 
  comment.Lpm = 'Based on 6.9 cm fork length: 6.9 * 200/185, based on photo';
data.Li = 21;    units.Li = 'cm'; label.Li = 'ultimate total length';              bibkey.Li = 'Wiki';

data.Wwb = 5.2e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';              bibkey.Wwb = 'Beer2005';
  comment.Wwb = 'Based on egg diameter of 1 mm: 4/3*pi*0.05^3';
data.Wwp = 5.18;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';bibkey.Wwp = 'Beer2005';
  comment.Wwpm = 'Based on 0.005102 * Lp^3.235, see F1';
data.Wwpm = 3.46;  units.Wwpm = 'g';  label.Wwpm = 'wet weight at puberty for males';bibkey.Wwpm = 'Beer2005';
  comment.Wwpm = 'Based on 0.005102 * Lpm^3.235, see F1';
data.Wwi = 96.6; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';               bibkey.Wwi = 'Wiki';
  comment.Wwi = 'Based on 0.005102 * Li^3.235, see F1; fishbase gives 220 g';

data.Ri = 6830/365;   units.Ri = '#/d';  label.Ri = 'Reprod rate max size';        bibkey.Ri = 'Beer2005';
  temp.Ri = C2K(16); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-weight
tW = [ ... % time since birth (yr), min/max wet weight (g)
0  0.25  0.80
1  1.00  1.75
2  1.70  5.40
3  2.50  9.00
4  7.80 14.50
5 14.50 18.00];
data.tW = [365 * (0.5 + tW(:,1)), sum(tW(:,[1 2]), 2)/ 2]; % convert yr to d
units.tW = {'d', 'g'}; label.tW = {'time since birth', 'wet weight', 'Zalewka creek'};  
temp.tW = C2K(16);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Beer2005';
comment.tW = 'Zalewka creek';
% 
tW1 = [ ... % time since birth (yr), min/max wet weight (g)
0 0.35  0.70
1 1.20  3.40
2 2.54  9.50
3 5.05 17.50
4 9.95 26.25];
data.tW1 = [365 * (0.5 + tW1(:,1)), sum(tW1(:,[1 2]), 2)/ 2]; % convert yr to d
units.tW1 = {'d', 'g'}; label.tW1 = {'time since birth', 'wet weight', 'Utrata river'};  
temp.tW1 = C2K(16);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'Beer2005';
comment.tW1 = 'Utrata river';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwb = 3*weights.Wwb;
weights.Lb = 0*weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW', 'tW1'}; subtitle1 = {'Data for Zalewka creek, Utrata river'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by E_Hp only';
D2 = 'Lb is ignorned: too long for its length';
D3 = 'Acceleration factor is poorly determined; ceiling s_M < 1.2 is implemented';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3);

%% Facts
F1 = 'Length-weight: Ww (in g) = 0.005102 * (TL in cm)^3.235 (';
metaData.bibkey.F1 = 'Beer2005'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3GP8J'; % Cat of Life
metaData.links.id_ITIS = '163658'; % ITIS
metaData.links.id_EoL = '46581748'; % Ency of Life
metaData.links.id_Wiki = 'Gobio_gobio'; % Wikipedia
metaData.links.id_ADW = 'Gobio_gobio'; % ADW
metaData.links.id_Taxo = '43733'; % Taxonomicon
metaData.links.id_WoRMS = '154316'; % WoRMS
metaData.links.id_fishbase = 'Gobio-gobio'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Gobio_gobio}}';  
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
bibkey = 'Beer2005'; type = 'Techreport'; bib = [ ...  
'author = {M. C. Beers}, ' ...
'year = {2005}, ' ...
'title = {Kennisdocument riviergrondel, \emph{Gobio gobio} ({L}innaeus, 1758)}, ' ... 
'institution = {Sportvisserij Nederland}, ' ...
'series = {Kennisdocument}, ' ...
'volume = {10}, '...
'howpublished = {\verb+\url{http://www.sportvisserijnederland.nl/files/kennisdocument-brasem_5023.pdf}+}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/4478}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
