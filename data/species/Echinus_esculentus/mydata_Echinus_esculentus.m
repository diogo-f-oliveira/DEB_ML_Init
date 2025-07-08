function [data, auxData, metaData, txtData, weights] = mydata_Echinus_esculentus

%% set metaData
metaData.phylum     = 'Echinodermata'; 
metaData.class      = 'Echinoidea'; 
metaData.order      = 'Camarodonta'; 
metaData.family     = 'Echinidae';
metaData.species    = 'Echinus_esculentus'; 
metaData.species_en = 'European edible sea urchin'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANE'};
metaData.ecoCode.habitat = {'0jMcp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biP', 'bjHa', 'bjCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'aj'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 09 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 09 04]; 

%% set data
% zero-variate data

data.tj = 45;    units.tj = 'd';    label.tj = 'time since birth at metam';    bibkey.tj = 'Wiki';
  temp.tj = C2K(10);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = 'temp guessed';
data.tp = 2*365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'EoL';
  temp.tp = C2K(10);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'between 1 and 3 yr, temp guessed';
data.am = 16*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'BIOTIC';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'temp guessed';

data.Lj  = 0.09;   units.Lj  = 'cm';  label.Lj  = 'length at metam';          bibkey.Lj  = 'BIOTIC';
  comment.Lj = 'between 0.68 and 0.95 mm';
data.Lp  = 6.1;    units.Lp  = 'cm';  label.Lp  = 'test diameter at puberty';  bibkey.Lp  = 'ComeAnse1988';
  comment.Lp = 'read from tL data for tp = 2 yr';
data.Li  = 17.6;    units.Li  = 'cm';  label.Li  = 'ultimate test diameter';   bibkey.Li  = 'Wiki';

data.Wwb = 8.8e-7;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'value taken from Echinocardium cordatum';
data.Wwp = 96;      units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'ComeAnse1988';
  comment.Wwp = 'computed as (Lp/11.2)^3 * 595.7';
data.Wwi = 2312;     units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'ComeAnse1988';
  comment.Wwi = 'computed as (Li/11.2)^3 * 595.7';

data.Ri = 20e6/365;    units.Ri = '#/d';    label.Ri = 'max reprod rate';        bibkey.Ri = 'Wiki';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'temp guessed';
 
% uni-variate data

% time-length
data.tL = [ ... % time since settlement (yr), test diameter (cm)
1.002	4.123
1.955	6.167
2.989	7.877
3.983	9.480
4.992	10.784
5.960	12.018];
data.tL(:,1) = (.5 + data.tL(:,1)) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since settlement', 'test diameter'};  
temp.tL    = C2K(10);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ComeAnse1988';
comment.tL = 'Data from Cuan, Scotland; temp fluctuales seasonally between 7 and 13 C';

% length-weight
WL = [ ... %  volume (ml), test diameter (cm)
50.089	4.869
98.046	6.066
198.224	7.748
395.382	9.790
595.737	11.245];
data.LW = WL(:,[2 1]); 
units.LW   = {'cm', 'g'};  label.LW = {'test diameter', 'wet weight'};  
bibkey.LW = 'ComeAnse1988';
comment.LW = 'Data from Cuan, Scotland; volume is converted to mass by 1 g/cm^3';

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

%% Discussion points
D1 = 'Weight at birth is guessed from Sterechinus which has Wd0 of 0.5 mug';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'The polychaete worm, Adyte assimilis and the copepod Pseudoanthessius liber are often found living as commensals among its spines and the parasitic copepod, Asterocheres echinola, often infests its gut';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '38LGL'; % Cat of Life
metaData.links.id_ITIS = '157949'; % ITIS
metaData.links.id_EoL = '599659'; % Ency of Life
metaData.links.id_Wiki = 'Echinus_esculentus'; % Wikipedia
metaData.links.id_ADW = 'Echinus_esculentus'; % ADW
metaData.links.id_Taxo = '41134'; % Taxonomicon
metaData.links.id_WoRMS = '124287'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Echinus_esculentus}}';
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
bibkey = 'ComeAnse1988'; type = 'Article'; bib = [ ... 
'author = {Comely, C. A. and Ansell, A. D.}, ' ... 
'year = {1988}, ' ...
'title = {Population Density and Growth of \emph{Echinus esculentus} {L}. on the {S}cottish {W}est {C}oast}, ' ...
'journal = {Estuarine, Coastel and Shelf Science}, ' ...
'volume = {27}, ' ...
'pages = {311-334}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BIOTIC'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.marlin.ac.uk/biotic/browse.php?sp=4193}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/599659/overview}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

