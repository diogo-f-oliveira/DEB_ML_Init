  function [data, auxData, metaData, txtData, weights] = mydata_Coregonus_chadary
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Coregonus_chadary'; 
metaData.species_en = 'Khadary-whitefish'; 

metaData.ecoCode.climate = {'Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg', 'Fs'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 02 10];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 02 10];

%% set data
% zero-variate data
data.am = 14*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'BochZuyk2017';   
  temp.am = C2K(13); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 40;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'fishbase'; 
  comment.Lp = 'from tL data at tp';
data.Li = 60;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.8e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'Based on egg diameter of 1.5 mm: pi/6*0.15^3';
data.Wwp = 810;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based in 0.00562*Li^3.22, see F1';
data.Wwi = 2988;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based in 0.00562*Li^3.22, see F1; max. published weight: 2.1 kg';
    
data.Ri = 12100/365; units.Ri = '#/d';  label.Ri = 'max reprod rate';          bibkey.Ri = 'fishbase';
  temp.Ri = C2K(13); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data

% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
 3	18.898
 4	20.341
 5	21.129
 6	21.522
 7	23.753
 8	25.984
 9	27.822
10	29.396
11	31.496
12	32.677
13	33.858];
data.tL(:,1) = 365 * (0.5 + data.tL(:,1));
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(24);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BochZuyk2017'; 

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
D1 = 'Males are supposed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight relationship: Ww in  g = 0.00562*(TL in cm)^3.22';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'YD8T'; % Cat of Life
metaData.links.id_ITIS = '623406'; % ITIS
metaData.links.id_EoL = '595675'; % Ency of Life
metaData.links.id_Wiki = 'Coregonus'; % Wikipedia
metaData.links.id_ADW = 'Coregonus_chadary'; % ADW
metaData.links.id_Taxo = '171702'; % Taxonomicon
metaData.links.id_WoRMS = '1020664'; % WoRMS
metaData.links.id_fishbase = 'Coregonus-chadary'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Coregonus}}';  
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
bibkey = 'BochZuyk2017'; type = 'Article'; bib = [ ...  
'author = {Nickolai A. Bochkarev and Elena I. Zuykova and Sergey A. Abramov and Elena V. Podorozhnyuk and Dmitry V. Politov}, ' ...
'year = {2017}, ' ...
'title = {The sympatric whitefishes \emph{Coregonus ussuriensis} and \emph{C. chadary} from the {A}mur {R}iver basin: {M}orphology, biology and genetic diversity}, ' ... 
'journal = {Fundam. Appl. Limnol.}, ' ...
'pages = {193–207}, ' ...
'volume = {189/3}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Coregonus-chadary}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

