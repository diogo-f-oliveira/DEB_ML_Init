function [data, auxData, metaData, txtData, weights] = mydata_Hyporhamphus_picarti

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Beloniformes'; 
metaData.family     = 'Hemiramphidae';
metaData.species    = 'Hyporhamphus_picarti'; 
metaData.species_en = 'African halfbeak'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21.9); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_T'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 01 27];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 01 27]; 

%% set data
% zero-variate data

data.am = 3*365;     units.am = 'd';    label.am = 'life span';             bibkey.am = 'guess';   
  temp.am = C2K(21.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 13.2;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'McBrThur2003'; 
  comment.Lp = 'based on same relative length, compared to Hemiramphus brasiliensis: 19.8/30*20';
data.Li  = 20.0;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 5.2e-4;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm of Hemiramphus brasiliensis: pi/6*0.1^3';
data.Wwi = 25.9;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fisfbase';
  comment.Wwi = 'based on 0.00219*Li^3.13';

data.Ri = 2e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate at 100 g';    bibkey.Ri  = {'guess','McBrThur2003'};   
  temp.Ri = C2K(21.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on data for Hemiramphus brasiliensis';
 
% uni-variate data
% t-L data
data.tL = [... % time since birth (d), standard length (cm)
1.951	0.390
2.904	0.545
3.857	0.432
3.947	0.470
3.993	0.545
4.809	0.470
4.855	0.488
4.946	0.521
4.991	0.399
4.991	0.634
5.898	0.423
5.898	0.658
5.944	0.512
5.989	0.756
6.897	0.578
6.897	0.643
6.897	0.658
6.897	0.977
6.987	0.676
6.987	0.733
7.804	0.939
7.895	0.681
7.895	0.897
7.895	0.977
7.940	0.751
7.985	0.822
7.985	1.024
8.893	0.977
8.893	0.855
8.893	0.770
8.938	1.029
8.938	0.888
9.891	1.090
9.936	1.127
9.982	0.676
9.982	0.747
9.982	0.911
10.844	0.996
10.844	1.113
10.844	1.216
10.844	1.254
11.887	1.292
11.933	1.371
11.978	1.047
11.978	1.573
12.840	1.277
12.931	1.428
12.931	1.442
12.931	1.461
12.931	1.479
12.931	1.578
12.976	1.155
12.976	1.315
13.838	1.747
13.884	1.555
13.884	1.724
13.975	1.456
14.882	1.569
14.882	1.583
14.882	1.639
14.882	1.785
15.926	1.616
15.926	1.649
16.833	1.808
16.878	1.597
16.878	1.733
19.056	1.766
22.005	2.160];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'standard length', '26.4 C'};  
temp.tL    = C2K(26.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'DoriNeum2018';
comment.tL = 'data from June';
%
data.tL1 = [... % time since birth (d), standard length (cm)
2.904	0.479
3.947	0.568
4.946	0.601
4.946	0.658
5.898	0.484
5.989	0.564
7.985	0.648
7.985	0.723
9.029	0.700
9.936	0.789
10.118	0.831
10.844	0.751
10.889	0.775
10.935	0.859
11.797	0.827
12.840	0.925
12.931	1.019
13.067	1.188
13.929	1.207
13.975	1.141
13.975	1.301
14.927	1.179
14.927	1.221
14.927	1.282
14.973	1.132
15.018	0.953
15.064	1.071
15.971	1.282
15.971	1.371
16.924	1.235
16.969	1.400
18.920	1.634
18.966	1.249
19.056	1.418
19.964	1.541
19.964	1.508
19.964	1.334
19.964	1.306
20.917	1.545];
units.tL1   = {'d', 'cm'};  label.tL1 = {'time since birth', 'standard length', '21 C'};  
temp.tL1    = C2K(21);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'DoriNeum2018';
comment.tL1 = 'data from Feb';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.tL1 = 5 * weights.tL1;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL','tL1'}; subtitle1 = {'data at 26.4, 21 C'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};


%% Discussion points
D1 = 'the fit of tL data is less than perfact, probalby due to late extension of the lower jaw';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'wet weight (g) = 0.00219*(TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3NYF2'; % Cat of Life
metaData.links.id_ITIS = '645167'; % ITIS
metaData.links.id_EoL = '46566999'; % Ency of Life
metaData.links.id_Wiki = 'Hyporhamphus'; % Wikipedia
metaData.links.id_ADW = 'Hyporhamphus_picarti'; % ADW
metaData.links.id_Taxo = '177191'; % Taxonomicon
metaData.links.id_WoRMS = '126390'; % WoRMS
metaData.links.id_fishbase = 'Hyporhamphus-picarti'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hyporhamphus}}'];
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
bibkey = 'DoriNeum2018'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jai.13528}, ' ...
'author = {D\"{o}ring and S. I. Neumann and H. Sloterdijk and W. Ekau}, ' ... 
'year = {2018}, ' ...
'title = {Seasonal growth differences of larval \emph{Hemirhamphus picarti} ({H}emiramphidae) in the {S}ine {S}aloum estuary, {S}enegal}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {34}, ' ...
'pages = {97-102}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'McBrThur2003'; type = 'Article'; bib = [ ... 
'author = {Richard S. McBride and Paul E. Thurman}, ' ... 
'year = {2003}, ' ...
'title = {Reproductive Biology of \emph{Hemiramphus brasiliensis} and \emph{H. balao} ({H}emiramphidae): {M}aturation, Spawning Frequency, and Fecundity}, ' ...
'journal = {Biol. Bull.}, ' ...
'volume = {204}, ' ...
'pages = {57-67}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [...
'howpublished = {\url{http://www.fishbase.org/summary/Hyporhamphus-picarti.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

