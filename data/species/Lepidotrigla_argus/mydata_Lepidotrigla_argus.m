  function [data, auxData, metaData, txtData, weights] = mydata_Lepidotrigla_argus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Triglidae';
metaData.species    = 'Lepidotrigla_argus'; 
metaData.species_en = 'Long-finned gurnard '; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIN','MPSW'};
metaData.ecoCode.habitat = {'bjMp','jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz','jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 10 26];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 26];

%% set data
% zero-variate data
data.ab = 8; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(24.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 6*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'Wiki';   
  temp.am = C2K(24.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 9;     units.Lp = 'cm';   label.Lp = 'std length at puberty'; bibkey.Lp = 'guess';
data.Li = 18;     units.Li = 'cm';   label.Li = 'ultimate std length';  bibkey.Li = 'fishbase';

data.Wwb = 1.8e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'SuzuGarc2013';
  comment.Wwb = 'based on egg diameter of 0.7 mm: pi/6*0.07^3';
data.Wwp = 5.6;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00676*Lp^3.06, see F1';
data.Wwi = 46.8;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00676*Li^3.06, see F1';
 
data.Ri = 10800/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate ';   bibkey.Ri = 'guess';
  temp.Ri = C2K(24.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on weight-correct value for Eutrigla_gurnardus; fecundity: 3e5*46.8/1300';

% uni-variate data

% time-length
data.tL = [ ... % time since hatch (yr), std length (cm)
0.002	4.496
0.002	4.599
0.002	4.806
0.002	6.718
0.009	3.979
0.010	6.977
0.016	3.979
0.017	6.357
0.017	6.357
0.024	4.651
0.024	5.426
0.024	5.633
0.024	5.737
0.024	6.047
0.025	7.390
0.038	5.013
0.996	6.210
0.996	6.778
0.997	8.897
0.997	9.207
1.005	9.776
1.005	10.086
1.005	10.655
1.011	7.502
1.012	8.277
1.012	10.345
1.013	13.497
1.018	5.125
1.018	7.140
1.020	11.120
1.021	14.066
1.028	12.153
1.049	11.688
1.985	11.542
1.985	11.800
1.993	13.454
1.998	9.009
1.999	11.335
2.000	13.867
2.000	14.332
2.000	14.591
2.001	15.986
2.001	16.503
2.006	9.164
2.006	9.371
2.006	9.991
2.006	10.146
2.007	12.627
2.007	12.885
2.007	13.092
2.008	15.573
2.009	16.710
2.014	10.353
2.015	15.366
2.021	10.612
2.023	15.211
2.028	10.818
2.030	14.953
2.043	12.059
3.008	12.894
3.010	16.253
3.010	16.512
3.010	17.855
3.016	15.013
3.017	15.323
3.024	15.788
3.024	16.822
3.024	16.977
3.025	17.080
3.025	17.545
3.031	13.824
3.031	14.083
3.031	15.892
3.038	14.548
4.003	15.435
4.018	15.952
4.019	17.709
4.025	16.314
4.997	15.909];
data.tL(:,1) = (0.8 + data.tL(:,1)) * 365; % convert yr to d
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
  temp.tL = C2K(24.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MeulWest2013';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwb = weights.Wwb * 5;
weights.Wwi = weights.Wwi * 5;
weights.Li = weights.Li * 5;
weights.tL = weights.tL * 3;
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
F1 = 'length-weight: Ww in g = 0.00676*(TL in cm)^3.06'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3TDVR'; % Cat of Life
metaData.links.id_ITIS = '644054'; % ITIS
metaData.links.id_EoL = '46568672'; % Ency of Life
metaData.links.id_Wiki = 'Lepidotrigla_argus'; % Wikipedia
metaData.links.id_ADW = 'Lepidotrigla_argus'; % ADW
metaData.links.id_Taxo = '178411'; % Taxonomicon
metaData.links.id_WoRMS = '274883'; % WoRMS
metaData.links.id_fishbase = 'Lepidotrigla-argus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Lepidotrigla_argus}}';  
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
bibkey = 'MeulWest2013'; type = 'Article'; bib = [ ...
'doi = {10.1111/jai.12181}, ' ...
'author = {van der Meulen, D. E. and West, R. J. and Gray, C. A.}, ' ...
'year = {2013}, ' ...
'title = {An assessment of otoliths, dorsal spines and scales to age the long-finned gurnard, \emph{Lepidotrigla argus} , {O}gilby, 1910 (Family: {T}riglidae)}, ' ... 
'journal = {Journal of Applied Ichthyology}, ' ...
'volume = {29(4)}, '...
'pages = {815–824}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Lepidotrigla-argus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

