function [data, auxData, metaData, txtData, weights] = mydata_Mesoplodon_stejnegeri

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Ziphiidae';
metaData.species    = 'Mesoplodon_stejnegeri'; 
metaData.species_en = 'Stejneger''s beaked whale'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvf', 'xiCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm   = [2023 08 18];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 08 18];

%% set data
% zero-variate data

data.tg = 365;     units.tg = 'd';    label.tg = 'gestation time';           bibkey.tg =  'guess';   
  temp.tg = C2K(35.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'Temp taken from Monodon';
data.tx = 365;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'guess';   
  temp.tx = C2K(35.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.am = 'based on Hyperoodon_ampullatus';
data.am = 40*365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(35.5);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Hyperoodon_ampullatus';

data.Lb = 210; units.Lb = 'cm';   label.Lb = 'length at birth'; bibkey.Lb = 'AraiYama2004';
data.Lp = 412; units.Lp = 'cm';   label.Lp = 'length at puberty'; bibkey.Lp = 'guess';
  comment.Lp = 'based on Hyperoodon_ampullatus: 735/980*550';
data.Li = 550; units.Li = 'cm'; label.Li = 'ultimate length for females'; bibkey.Li = 'Wiki';
data.Lim = 525; units.Lim = 'cm'; label.Lim = 'ultimate length for males'; bibkey.Lim = 'Wiki';

data.Wwb = 73.4e3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on Hyperoodon_ampullatus: (210/550)^3*1.32e6';
data.Wwi = 1.32e6; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight females'; bibkey.Wwi = 'Carw1995';
  comment.Wwi = 'Carw1995: 1-1.5 ton. EoL gives 4.8 ton. Value based on Hyperoodon_ampullatus: (550/980)^3*7.5e6';
  
data.Ri  = 1/365/2;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(35.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Hyperoodon_ampullatus';
  
% univariate data
% time-length
data.tL = [ ... % Growth Layer Group (#), length of root cementum (cm)
1.129	0.027
1.643	0.820
1.868	1.039
2.575	2.050
2.703	1.860
3.475	2.025
3.539	2.544
3.925	2.436
4.503	2.874
5.050	3.148
5.532	3.886
6.046	4.187
6.592	5.580
7.042	5.800
7.492	6.183
8.039	6.539
8.456	6.758
9.003	6.950
9.453	8.589
10.063	8.508
10.610	9.247
11.092	9.329
11.574	9.904
12.056	9.932
12.570	10.807
12.956	10.780
13.342	10.945
14.081	10.947
14.659	11.057
14.884	11.085
15.527	11.168
16.106	11.224
16.556	11.307
17.038	11.308
17.584	11.692
18.130	11.720
18.516	12.076
19.030	12.159
19.448	12.460
20.091	12.598
20.412	12.599
20.959	12.600
21.505	12.601
21.987	12.548
22.405	12.604
22.726	12.577
23.016	12.496
23.498	12.579
23.851	12.552
24.558	12.527
24.976	12.610
25.426	12.583
26.005	12.585
26.358	12.558
26.969	12.614
27.483	12.588
27.901	12.535
28.479	12.536
28.897	12.564
29.347	12.620
29.926	12.512
30.440	12.622
31.018	12.651
31.468	12.597
31.822	12.571
32.368	12.545
32.786	12.573
33.397	12.547
34.007	12.631
34.393	12.604
34.939	12.578];
data.tL(:,1) = (data.tL(:,1) - data.tL(1,1))*365/2; % convert yr to d
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'length of root cementum'};
  temp.tL = C2K(35.5); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'AraiYama2004';
comment.tL = 'Data from Akita; 1/2 year was assumed for each group layer';

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Teeth-length in tL data is taken to be propotional to total length, but this is not sure at all';
D3 = 'Two group layers per year werr assumed, with one per year, the gestation time becomes too long';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '4256W'; % Cat of Life
metaData.links.id_ITIS = '180514'; % ITIS
metaData.links.id_EoL = '46559383'; % Ency of Life
metaData.links.id_Wiki = 'Mesoplodon_stejnegeri'; % Wikipedia
metaData.links.id_ADW = 'Mesoplodon_stejnegeri'; % ADW
metaData.links.id_Taxo = '68844'; % Taxonomicon
metaData.links.id_WoRMS = '254991'; % WoRMS
metaData.links.id_MSW3 = '14300170'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mesoplodon_stejnegeri}}';
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
bibkey = 'AraiYama2004'; type = 'Article'; bib = [ ... 
'author = {Kazumi Arai and Tadasu K. Yamada and Yoshiro Takano}, ' ... 
'year = {2004}, ' ...
'title = {Age estimation of male {S}tejneger''s beaked whales (\emph{Mesoplodon stejnegeri}) based on counting of growth layers in tooth cementum}, ' ...
'journal = {Mammal Study}, ' ...
'volume = {29}, ' ...
'pages = {125–136}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Mesoplodon_stejnegeri/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/46559383/data}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Carw1995'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Mark Carwardine}, ' ...
'year = {1995}, ' ...
'title  = {Whales, dolphins and porpoises}, ' ...
'publisher = {Dorling Kindersley}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

