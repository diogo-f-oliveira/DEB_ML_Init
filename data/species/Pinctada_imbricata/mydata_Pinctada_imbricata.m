function [data, auxData, metaData, txtData, weights] = mydata_Pinctada_imbricata
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Pterioida'; 
metaData.family     = 'Pteriidae';
metaData.species    = 'Pinctada_imbricata'; 
metaData.species_en = 'Akoya pearl oyster'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIN', 'MPSW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 04 27];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 04 27]; 

%% set data
% zero-variate data

data.am = 3*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'MarcPrie2005';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 0.97;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess';
  comment.Lp = 'based on same relative length, compared to Pinctada_margaritifera: 8.51*4/35';
data.Li  = 8.51;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'MarcPrie2005';

data.Wwb = 14.3e-9; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on Pinctada_margaritifera';
data.Wwi = 84; units.Wwi = 'g';   label.Wwi = 'flesh wet weight';   bibkey.Wwi = 'MarcPrie2005';
  comment.Wwi = 'Based on 0.00007*(Li*10)^3.15';
  
data.Ri  = 1e7; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Guessed based on kap = 0.74 as found for Pinctada_margaritifera';
  
% uni-variate data

% time-length
data.tL = [ ... % time (month), shell length (cm)
-1.262	0.959
-0.297	1.187
0.669	1.531
1.747	2.144
2.640	3.006
3.681	3.446
4.794	3.675
5.611	3.770
6.724	3.825
7.763	4.054
8.692	4.398
9.695	5.030
10.625	5.585
11.703	6.198
12.780	6.580
13.671	6.905
14.748	7.134
15.935	7.305
16.714	7.361
17.753	7.379
18.792	7.358
19.719	7.376
20.758	7.489
21.686	7.641
22.725	7.755
23.727	7.926
24.692	8.020
25.730	8.096
26.806	8.094
27.660	8.227
28.773	8.225
29.885	8.166
30.775	8.203];
data.tL(:,1) = (data.tL(:,1) - data.tL(1,1)) * 30.5; % convert mnth to d 
units.tL   = {'d', 'cm'};  label.tL = {'time', 'shell length'};  
temp.tL    = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MarcPrie2005';
comment.tL = 'Temperature (in C) is supposed to vary as T(t)=25+3*sin(2*pi*(t-t_0)/365)';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 50;
weights.Ri = weights.Ri * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Hermaphrodite: First male then female';
metaData.bibkey.F1 = {'MarcPrie2005'}; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4HY7P'; % Cat of Life
metaData.links.id_ITIS = '79593'; % ITIS
metaData.links.id_EoL = '46467328'; % Ency of Life
metaData.links.id_Wiki = 'Pinctada'; % Wikipedia
metaData.links.id_ADW = 'Pinctada_imbricata'; % ADW
metaData.links.id_Taxo = '529287'; % Taxonomicon
metaData.links.id_WoRMS = '207901'; % WoRMS
metaData.links.id_molluscabase = '207901'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pinctada_fucata}}';
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
bibkey = 'MarcPrie2005'; type = 'Article'; bib = [ ... 
'doi = {10.7773/cm.v31i2.55}, ' ...
'author = {Jes''{u}s S. Marcano and Antulio Prieto and Asdr\''{u}bal L\''{a}rez and Jos\''{e} J. Ali\''{o} and Hargadys Sanabria}, ' ... 
'year = {2005}, ' ...
'title = {Growth and mortality of \emph{Pinctada imbricata} ({M}ollusca: {P}teridae) in {G}uamachito, {A}raya {P}eninsula, {S}ucre {S}tate, {V}enezuela}, ' ...
'journal = {Ciencias Marinas}, ' ...
'volume = {31}, ' ...
'pages = {387-397}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

