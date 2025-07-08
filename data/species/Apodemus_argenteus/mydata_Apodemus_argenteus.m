function [data, auxData, metaData, txtData, weights] = mydata_Apodemus_argenteus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Muridae';
metaData.species    = 'Apodemus_argenteus'; 
metaData.species_en = 'Small Japanese field mouse'; 

metaData.ecoCode.climate = {'Dfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM','xiHs','xiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.9); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 11 04]; 

%% set data
% zero-variate data

data.tg = 27.5;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'guess';   
  temp.tg = C2K(37.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 21;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'Ruji1978';   
  temp.tx = C2K(37.9);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '28-30 d';
data.tp = 61;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'Koya1995';
  temp.tp = C2K(37.9);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 5*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
    
data.Wwb = 1.4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Ruji1978';
data.Wwi = 13;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Ruji1978';

data.Ri  = 4.2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Koya1995';   
  temp.Ri = C2K(37.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 litter per yr, 4.2 pups per litter';

% uni-variate data

% time-weight
data.tWw = [ ... % time since birth (d), weight (g)
0.907	1.416
1.843	1.550
2.911	1.791
4.113	2.005
5.179	2.326
5.842	2.647
7.043	2.941
8.375	3.369
9.308	3.637
10.106	3.931
11.040	4.145
12.115	4.065
12.909	4.520
14.245	4.788
17.054	5.109
18.921	5.591
20.926	5.912
24.391	6.902
27.464	7.464
29.863	8.106
33.739	8.722
37.614	9.392
41.363	9.713
45.789	9.715
49.663	10.411
54.622	10.573
59.705	11.215
64.801	11.217
70.047	10.577
74.720	11.541
80.067	12.317
84.913	11.570
90.259	12.400];
units.tWw  = {'d', 'g'};  label.tWw = {'time', 'weight'};  
temp.tWw  = C2K(37.9);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'Ruji1978';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 10 * weights.tWw;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
%weights.psd.t_0 = 3;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to not differ from females';
D2 = 'head+body length does nt grow isomorphically';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = 'FRHT'; % Cat of Life
metaData.links.id_ITIS = '585128 '; % ITIS
metaData.links.id_EoL = '1178740'; % Ency of Life
metaData.links.id_Wiki = 'Apodemus_argenteus'; % Wikipedia
metaData.links.id_ADW = 'Apodemus_argenteus'; % ADW
metaData.links.id_Taxo = '62914'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13001206'; % MSW3
metaData.links.id_AnAge = 'Apodemus_argenteus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Apodemus_argenteus}}';
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
bibkey = 'Ruji1978'; type = 'Article'; bib = [ ... 
'author = {Rujimaki, Y.}, ' ... 
'year = {1978}, ' ...
'title = {Postnatalgrowth and development of \emph{Apodemus argenteus}}, ' ...
'journal = {J. Mamm. Soc. Japan}, ' ...
'volume = {7}, ' ...
'pages = {135-142}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Koya1995'; type = 'Article'; bib = [ ... 
'author = {Sachiko Koyama}, ' ... 
'year = {1995}, ' ...
'title = {Reproductive  Activity of the {J}apanese Long-tailed  Field  Mouse \emph{Apodemus  argenteus} under  Laboratory  Conditions }, ' ...
'journal = {J. Mamm.  Soc. Japan}, ' ...
'volume = {20(2)}, ' ...
'pages = {117-124}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Apodemus_argenteus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

