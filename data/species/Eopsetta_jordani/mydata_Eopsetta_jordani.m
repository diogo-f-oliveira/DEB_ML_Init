function [data, auxData, metaData, txtData, weights] = mydata_Eopsetta_jordani

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Pleuronectidae';
metaData.species    = 'Eopsetta_jordani'; 
metaData.species_en = 'Petrale sole'; 

metaData.ecoCode.climate = {'MC', 'ME'};
metaData.ecoCode.ecozone = {'MPNE'};
metaData.ecoCode.habitat = {'0jFe', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mdc'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2019 05 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 06]; 

%% set data
% zero-variate data

data.ab = 324.5/24;    units.ab = 'd';  label.ab = 'age at birth';                bibkey.ab = 'AldeForr1971';   
  temp.ab = C2K(4.1); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 35*365;    units.am = 'd';  label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(5); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 44;  units.Lp  = 'cm';  label.Lp  = 'length at puberty';  bibkey.Lp  = 'fishbase';
data.Li  = 70;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'fishbase';
data.Lim  = 53;   units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';   bibkey.Lim  = 'fishbase';

data.Wwb = 1e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AldeForr1971';
  comment.Wwb = 'based on egg diameter 1.24 mm: pi/6*0.124^3';
data.Wwp = 822;  units.Wwp = 'g';   label.Wwp = 'wet weight puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00661*Lp^3.10, see F1';
data.Wwi = 3.5e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00661*Li^3.10, see F1';
data.Wwim = 1.46e3;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'fishbase';
  comment.Wwim = 'based on 0.00661*Lim^3.10, see F1';
  
data.Ri  = 1.2e6/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-length
data.tL_f = [ ... % yr class (yr), total length (cm)
    1 11.0
    2 19.0
    3 25.0
    4 30.0
    5 34.5
    6 38.5
    7 41.5
    8 44.0
    9 46.0
   10 47.7
   11 49.2
   12 50.6
   13 51.9
   14 52.2
   15 54.5
   16 55.4
   17 57.2
   18 58.2
   19 57.3
   20 58.9
   21 59.9];
data.tL_f(:,1) = 365 * data.tL_f(:,1); 
units.tL_f = {'d', 'cm'}; label.tL_f = {'time', 'total length', 'female'};  
temp.tL_f = C2K(5); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Krug1969';
comment.tL_f = 'Data for females';
% 
data.tL_m = [ ... % yr class (yr), total length (cm)
    1 10.5
    2 18.5
    3 26.0
    4 31.5
    5 34.6
    6 36.8
    7 38.5
    8 40.1
    9 41.4
   10 42.5
   11 43.4
   12 44.2
   13 45.0
   14 45.8
   15 46.3
   16 46.8
   17 47.3];
data.tL_m(:,1) = 365 *  data.tL_m(:,1); 
units.tL_m = {'d', 'cm'}; label.tL_m = {'time', 'total length', 'male'};  
temp.tL_m = C2K(5); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Krug1969';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 50 * weights.tL_f;
weights.tL_m = 50 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'};  subtitle1 = {'Data for female, male'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'tL data suggests that food density increases with age, which has been implemented';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight Ww in g = 0.00661*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '6FKWW'; % Cat of Life
metaData.links.id_ITIS = '172868'; % ITIS
metaData.links.id_EoL = '46570151'; % Ency of Life
metaData.links.id_Wiki = 'Eopsetta_jordani'; % Wikipedia
metaData.links.id_ADW = 'Eopsetta_jordani'; % ADW
metaData.links.id_Taxo = '173833'; % Taxonomicon
metaData.links.id_WoRMS = '280690'; % WoRMS
metaData.links.id_fishbase = 'Eopsetta-jordani'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Eopsetta_jordani}}';
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
bibkey = 'Krug1969'; type = 'Article'; bib = [ ... 
'author = {F. Kr\"{u}ger}, ' ... 
'year = {1969}, ' ...
'title = {Das asymptotische {W}achstum der {F}ische - ein Nonsens?}, ' ...
'journal = {Helgol\"{a}nder wiss. Meeresunters.}, ' ...
'volume = {19}, ' ...
'pages = {1123-1138}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AldeForr1971'; type = 'Article'; bib = [ ... 
'author = {Alderdice, D. F. and C. R. Forrester}, ' ... 
'year = {1971}, ' ...
'title = {Effects of salinity and temperature on embryonic development of the petrale sole (Eopsetta iordani). }, ' ...
'journal = {J. Fish. Res. Bd. Canada}, ' ...
'volume = {28}, ' ...
'pages = {727-744}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/521}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

