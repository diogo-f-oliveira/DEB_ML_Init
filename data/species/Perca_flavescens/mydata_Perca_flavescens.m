function [data, auxData, metaData, txtData, weights] = mydata_Perca_flavescens

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Percidae';
metaData.species    = 'Perca_flavescens'; 
metaData.species_en = 'Yellow perch'; 

metaData.ecoCode.climate = {'Cfa', 'Df'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr', '0iFl', '0iFp'};
metaData.ecoCode.embryo  = {'Fc', 'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'piCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2020 08 18];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 18];

%% set data
% zero-variate data

data.am = 11 * 365; units.am = 'd';  label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(13); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 19.2;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase';
data.Li  = 50;   units.Li  = 'cm';   label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 6e-3; units.Wwb = 'g';    label.Wwb = 'wet weight at puberty';     bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 2.25 mm of Perca fluviatilis: pi/6*0.225^3';
data.Wwp = 98; units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01230*Lp^3.04, see F1';
data.Wwi = 1.8e3; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01230*Li^3.04, see F1; fishbase gives 1.9 kg';
 
data.Ri = 61465/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate';   bibkey.Ri = 'fishbase';
  temp.Ri = C2K(22); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time - length
data.tL = [ ... % time since hatch (yr), length (cm)
0.884	7.624
1.167	6.559
1.880	13.315
2.934	14.319
3.097	13.158
3.891	15.276
4.176	14.887
5.042	16.763
6.125	19.602
7.037	21.333
8.020	22.724
8.992	28.319];
data.tL(:,1) = 365 * data.tL(:,1);
units.tL   = {'d', 'cm'};  label.tL = {'time since hatch', 'total length'};  
temp.tL    = C2K(13);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'RyanHarv1980';
comment.tL = 'temp not specified, here analysed using mean 13 C';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Wwb = 5 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight: Ww in g = 0.01230*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from Photo: SL = 0.85 * TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '76RQZ'; % Cat of Life
metaData.links.id_ITIS = '168469'; % ITIS
metaData.links.id_EoL = '46580127'; % Ency of Life
metaData.links.id_Wiki = 'Perca_flavescens'; % Wikipedia
metaData.links.id_ADW = 'Perca_flavescens'; % ADW
metaData.links.id_Taxo = '45190'; % Taxonomicon
metaData.links.id_WoRMS = '275313'; % WoRMS
metaData.links.id_fishbase = 'Perca-flavescens'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Perca_flavescens}}';
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
bibkey = 'RyanHarv1980'; type = 'Article'; bib = [ ... 
'author = {Patrick M. Ryan and Harold H. Harvey}, ' ... 
'year = {1980}, ' ...
'title = {Growth responses of yellow perch, \emph{Perca flauescens} ({M}itchill), to lake acidification in the {L}a {C}lothe {M}ountain {L}akes of {O}ntario}, ' ...
'journal = {Env. Biol. Fish.}, ' ...
'volume = {5(2)}, ' ...
'pages = {97-108}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Perca-flavescens.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishesoftexas'; type = 'Misc'; bib = ...
'howpublished = {\url{http://txstate.fishesoftexas.org/perca flavescens.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

