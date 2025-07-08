function [data, auxData, metaData, txtData, weights] = mydata_Cetengraulis_edentulus

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Engraulidae';
metaData.species    = 'Cetengraulis_edentulus'; 
metaData.species_en = 'Atlantic anchoveta'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'piMpe', '0jFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 17];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 17];

%% set data
% zero-variate data
data.ab = 4; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(27.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 3*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(27.4);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 13.7;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 20.5;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.7e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 23;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00490*Lp^3.23, see F1';
data.Wwi = 140.58;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'max published weight; based on  0.00490*Li^3.23, see F1, gives 84.6 g';

data.Ri  = 2*11028/365; units.Ri  = '#/d';label.Ri  = 'max reprod rate';    bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(27.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '11018 eggs per spawning; assumed 2 spawings per yr';

% uni-variate data
% time-length
data.tL = [ ... % time since hatch (d), total length (cm)
-0.011	3.638
-0.011	5.533
-0.011	5.818
-0.011	5.913
-0.004	6.955
-0.004	7.287
-0.004	7.808
-0.004	8.330
0.001	4.728
0.002	6.244
0.007	4.206
0.008	6.481
0.989	8.460
0.989	8.981
0.995	8.792
0.995	9.266
0.996	12.346
1.001	9.834
1.002	10.545
1.014	10.924
1.014	11.398
1.014	11.825
1.020	10.261
1.988	10.439
1.988	12.003
1.989	14.088
1.989	14.372
1.994	10.865
1.994	11.055
1.994	11.292
1.994	11.576
1.995	12.761
1.995	13.093
1.995	13.424
1.995	13.756
1.995	14.657
2.001	12.382
2.002	14.941
2.014	15.320
3.000	14.218
3.000	14.503
3.001	17.062
3.005	12.370
3.005	12.654
3.006	13.081
3.006	13.602
3.006	13.839
3.006	14.834
3.006	15.972
3.007	16.209
3.007	16.588
3.012	12.844
3.012	15.119
3.012	15.308
3.012	15.592
3.018	13.270
3.986	15.676
4.005	15.154
4.005	15.960
4.005	16.292
4.005	16.766];
data.tL(:,1) = (data.tL(:,1) + 0.5)*365; % convert yr to d
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1); data.tL(i,1)=data.tL(i-1,1)+1e-8;end;end
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(27.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = 'SouzSchw2011';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 3;
weights.Wwi = weights.Wwi * 0;
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00490*(TL in cm)^3.23'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'T5ZT'; % Cat of Life
metaData.links.id_ITIS = '161861'; % ITIS
metaData.links.id_EoL = '46562686'; % Ency of Life
metaData.links.id_Wiki = 'Cetengraulis_edentulus'; % Wikipedia
metaData.links.id_ADW = 'Cetengraulis_edentulus'; % ADW
metaData.links.id_Taxo = '170283'; % Taxonomicon
metaData.links.id_WoRMS = '280091'; % WoRMS
metaData.links.id_fishbase = 'Cetengraulis-edentulus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Cetengraulis_edentulus}}';  
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
bibkey = 'SouzSchw2011'; type = 'Article'; bib = [ ... 
'doi = {0.1590/S1984-46702011000300003}, ' ...
'author = {Jos\''{e} Maria Souza-Concei\c{c}\~{a}o and Paulo Ricardo Schwingel}, ' ...
'year = {2011}, ' ...
'title = {Age and growth of \emph{Cetengraulis edentulus} ({C}lupeiformes: {E}ngraulidae) in a subtropical bight of Southern Coast {B}razil}, ' ... 
'journal = {Zoologia}, ' ...
'volume = {28(3)}, '...
'pages = {297–304}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Cetengraulis-edentulus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  