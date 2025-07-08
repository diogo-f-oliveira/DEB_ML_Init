function [data, auxData, metaData, txtData, weights] = mydata_Microcondylaea_bonellii
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Unionoida'; 
metaData.family     = 'Unionidae';
metaData.species    = 'Microcondylaea_bonellii'; 
metaData.species_en = 'Freshwater mussel'; 

metaData.ecoCode.climate = {'BSk', 'Cfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr','0iFp'};
metaData.ecoCode.embryo  = {'Fbb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjTvf', 'jiPp'};
metaData.ecoCode.gender  = {'D','Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li';  'Ri'; 'Wwi'};
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; 

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 02 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator    = {'Starrlight Augustine'};                             
metaData.email_cur  = {'sta@akvaplan.niva.no'};                 
metaData.date_acc   = [2021 02 06];      


%% set data
% zero-variate data

data.ab = 10;    units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'unio';   
  temp.ab = C2K(18);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 60*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = .02; units.Lb  = 'cm';  label.Lb  = 'shell length at birth';   bibkey.Lb  = 'unio';  
data.Lj  = .03; units.Lj  = 'cm';  label.Lj  = 'shell length at settlement';   bibkey.Lj  = 'guess';  
data.Lp  = 3.5;   units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'guess';
  comment.Lp = 'based on tp = 4-5 yr and tL data';
data.Li  = 8.5;  units.Li  = 'cm';  label.Li  = 'ultimate shell length';   bibkey.Li  = 'NageCast2007';

data.Wwi  = 22.1; units.Wwi  = 'g';  label.Wwi  = 'ultimate dry weight';  bibkey.Wwi  = 'guess';
  comment.Wwi = 'based on size-corrected value for Unio_tumidus : 14*(8.5/7.3)^3';
  
data.Ri = 1e5/365;    units.Ri = '1/d';    label.Ri = 'maximum reproduction rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(18);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
  
% time-length
data.LL = [ ... % shell length (cm), shell length after 1 yr (cm)
0.883	2.436
0.894	2.896
1.000	3.168
1.011	3.355
1.181	3.169
1.181	2.999
1.191	3.356
1.287	3.578
1.287	3.442
1.309	2.710
1.681	2.711
1.787	3.443
1.883	3.682
1.936	3.512
2.000	3.121
2.021	3.768
2.245	3.871
2.415	3.973
2.500	4.246
2.681	4.332
2.691	4.621
2.702	3.821
2.904	4.673
3.000	4.843
3.074	4.571
3.085	5.031
3.202	4.759
3.287	4.419
3.298	5.423
3.383	4.674
3.404	4.453
3.500	5.100
3.596	4.522
3.596	4.964
3.691	5.679
3.777	5.816
3.904	4.898
4.202	5.324
4.319	5.512
4.383	5.648
4.415	5.529
4.500	5.138
4.606	5.870
4.606	6.057
4.691	5.683
4.745	5.956
4.862	5.871
5.000	6.637
5.053	5.804
5.415	6.996
5.500	6.537
5.723	6.214
5.777	6.640
5.989	6.335
6.000	6.454
6.000	7.151
6.298	6.659
6.606	7.392
6.904	7.308
8.319	8.266];
units.LL = {'cm', 'cm'}; label.LL = {'shell length', 'shell length after 1 yr'};  
temp.LL = C2K(18);  units.temp.LL = 'K'; label.temp.LL = 'temperature';
bibkey.LL = 'NageCast2007';
comment.LL = 'Data from Torrente Versa, Italy; mean temperature is guessed';

%% set weights for all real data
weights = setweights(data, []);
weights.LL = 10 * weights.LL;
weights.Li = 5 * weights.Li;
weights.Lj = 0 * weights.Lj;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; weights.psd.k = 1; units.psd.k = '-'; label.psd.k = 'maintenance ratio';
%weights.psd.p_M = 0;
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '42TST'; % Cat of Life
metaData.links.id_ITIS = '988643'; % ITIS
metaData.links.id_EoL = '4751792'; % Ency of Life
metaData.links.id_Wiki = 'Microcondylaea'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '1685978'; % Taxonomicon
metaData.links.id_WoRMS = '1067371'; % WoRMS
metaData.links.id_molluscabase = '1067371'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Microcondylaea}}';
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
bibkey = 'unio'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.unio.lu/freshwater-mussel/biology/reproduction-cycle/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NageCast2007'; type = 'Article'; bib = [ ...
'author = {Karl-Otto Nagel and Lucio Castagnolo and Elisa Cencetti and Guiseppe A. Moro}, ' ... 
'year = {2007}, ' ...
'title = {Notes on reproduction, growth and habitat of \emph{Microcondylaea bonellii} ({M}ollusca: {B}ivalvia: {U}nionidae) in the {T}orrente {V}ersa ({I}taly)}, ' ...
'journal = {Mollusca}, ' ...
'volume = {25(1)}, ' ...
'pages = {41-49}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

