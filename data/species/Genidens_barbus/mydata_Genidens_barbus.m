function [data, auxData, metaData, txtData, weights] = mydata_Genidens_barbus
%% set metaData

metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Ariidae';
metaData.species    = 'Genidens_barbus'; 
metaData.species_en = 'White sea catfish '; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mbm'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 11 03];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 03];

%% set data
% zero-variate data;

data.am = 36*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'VelaReis2007';
  temp.am = C2K(23.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 41.5;  units.Lp  = 'cm';	label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase';
data.Li  = 120;   units.Li  = 'cm';	label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase'; 

data.Wwb = 1.15; units.Wwb = 'g';	label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'Mira2001'; 
  comment.Wwb = 'based on egg diameter of 13 mm: pi/6*1.3^3';
data.Wwp  = 647; units.Wwp  = 'g';	label.Wwp  = 'wet weight at puberty';    bibkey.Wwp  = 'fishbase'; 
  comment.Wwp = 'based on 0.007243*Lp^3.06, see F1';
data.Wwi  = 16.7e3; units.Wwi  = 'g';	label.Wwi  = 'ultimate wet weight';    bibkey.Wwi  = 'fishbase'; 
  comment.Wwi = 'based on 0.007243*Li^3.06, see F1, give 1.3 kg';

data.GSI = 0.10; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';   bibkey.GSI = 'Mira2001';
  temp.GSI = C2K(23.5);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
0.152	8.326
0.524	12.634
0.818	10.052
0.894	14.359
1.044	17.230
1.485	14.075
1.560	16.946
1.782	16.947
2.076	15.513
2.153	19.533
2.743	19.536
6.964	40.228
7.924	41.094
8.885	43.396
9.994	45.985
10.808	47.999
10.883	50.296
11.842	48.866
11.992	53.173
35.936	93.202
35.940	98.944];
data.tL(:,1) = 365 * (0.8 + data.tL(:,1)); % conver yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(23.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'VelaReis2007';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: W in g = 0.007243*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL = 0.9*TL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '6JZPM'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '63616281'; % Ency of Life
metaData.links.id_Wiki = 'Genidens_barbus'; % Wikipedia
metaData.links.id_ADW = 'Genidens_barbus'; % ADW
metaData.links.id_Taxo = '174829'; % Taxonomicon
metaData.links.id_WoRMS = '280825'; % WoRMS
metaData.links.id_fishbase = 'Genidens-barbus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Genidens_barbus}}';
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
bibkey = 'VelaReis2007'; type = 'Article'; bib = [ ... 
'author = {G. Velasco and E. G. Reis and J. P. Vieira},'...
'title = {Calculating growth parameters of \emph{Genidens barbus} ({S}iluriformes, {A}riidae) using length composition and age data},'...
'journal = {J. Appl. Ichthyol.}, '...
'volume = {23}, '...
'year = {2007}, '...
'pages = {64–69}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mira2001'; type = 'Article'; bib = [ ... 
'author = {Jean Carlos Miranda},'...
'title = {Reproductive biology of \emph{Genidens genidens}, a catfish from the {M}aric\''{a} lagoon, RJ},'...
'journal = {Ci\^{e}ncia e Cultura}, '...
'volume = {52(2)}, '...
'year = {2001}, '...
'pages = {121-126}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Genidens-barbus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

