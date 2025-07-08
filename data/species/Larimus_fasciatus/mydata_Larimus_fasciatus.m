function [data, auxData, metaData, txtData, weights] = mydata_Larimus_fasciatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Larimus_fasciatus'; 
metaData.species_en = 'Banded drum'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23.8); % K, body temp
metaData.data_0     = {'ab';  'am'; 'Lp'; 'Li';  'Wwb'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 14];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 14];

%% set data
% zero-variate data

data.ab = 6;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(23.8); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 3*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'StanChit1984';   
  temp.am = C2K(23.8);   units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 13.5;   units.Lp   = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 25;  units.Li   = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 0.37e-3; units.Wwb = 'g';label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on  Argyrosomus_regius';
data.Wwp = 25.8; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00851*Lp^3.087, see F1';
data.Wwi = 172; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00851*Li^3.08, see F1';
 
% uni-variate data
data.tL =	[ ... % year class (yr), total length (cm)
    0  7.2
    1 12.4
    2 15.4
    3 17.0]; 
data.tL(:,1) = (0.8 + data.tL(:,1)) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(23.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Erzi1991'; comment.tL = 'record 254';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
13.608	78765.008
13.684	43910.807
13.694	49399.662
13.891	36500.857
13.990	32384.219
14.002	48576.334
14.090	71355.059
14.193	86998.285
14.202	47753.007
14.294	50771.867
14.303	53241.850
14.315	70531.731
14.404	59828.471
14.482	74922.815
14.491	76020.581
14.596	60377.361
14.600	39245.279
14.606	66963.976
14.607	71355.059
14.613	102092.622
14.686	52418.522
14.691	77118.353
14.706	107581.478
14.788	64768.438
14.798	111149.227
14.801	46929.679
14.811	55162.956
14.908	78490.564
14.934	42538.590
15.001	84528.302
15.105	142984.563
15.290	72452.831
15.301	46106.351
15.307	74099.487
15.388	63121.782
15.480	106209.261
15.796	100994.856
16.296	139965.697];
units.LN   = {'cm','#'};  label.LN = {'total length','fecundity'};  
temp.LN    = C2K(23.8);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'StanChit1984'; comment.LN = 'record 254';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k_J = 0; weights.psd.k = 0.1; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to not differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00851*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6NXPN'; % Cat of Life
metaData.links.id_ITIS = '646537'; % ITIS
metaData.links.id_EoL = '46579039'; % Ency of Life
metaData.links.id_Wiki = 'Larimus'; % Wikipedia
metaData.links.id_ADW = 'Larimus_fasciatus'; % ADW
metaData.links.id_Taxo = '178204'; % Taxonomicon
metaData.links.id_WoRMS = '159320'; % WoRMS
metaData.links.id_fishbase = 'Larimus-fasciatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Larimus}}';
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
bibkey = 'Erzi1991'; type = 'techreport'; bib = [ ... 
'author = {Erzini, K.}, ' ... 
'year = {1991}, ' ...
'title = {A compilation of data on variability in length-age in marine fishes}, ' ...
'institution = {Fisheries Stock Assessment, Title XII, Collaborative Research Support Program, University of Rhode Island}, ' ...
'volume = {Working paper 77}, ' ...
'pages = {1-36}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'StanChit1984'; type = 'article'; bib = [ ... 
'author = {Gary W. Standard  and Mark E. Chittenden}, ' ... 
'year = {1984}, ' ...
'title = {REPRODUCTION, MOVEMENTS, AND POPULATION DYNAMICS OF THE BANDED DRUM, \emph{Larimus fasciatus}, IN THE {G}ULF OF {M}EXICO}, ' ...
'journal = {Fishery Bulletin}, ' ...
'volume = {82(2)}, ' ...
'pages = {337-363'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Larimus-fasciatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

