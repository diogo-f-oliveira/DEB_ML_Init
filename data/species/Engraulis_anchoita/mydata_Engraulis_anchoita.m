  function [data, auxData, metaData, txtData, weights] = mydata_Engraulis_anchoita

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Engraulidae';
metaData.species    = 'Engraulis_anchoita'; 
metaData.species_en = 'Argentine anchoita'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0iMcp'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(8); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};        
metaData.date_subm   = [2018 12 26];                           
metaData.email       = {'bas.kooijman@vu.nl'};                 
metaData.address     = {'VU University Amsterdam'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 12 26];

%% set data
% zero-variate data
data.ab = 6;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(15); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on  Engraulis encrasicolus';
data.am = 5*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(8); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on  Engraulis encrasicolus';

data.Lp = 9;      units.Lp = 'cm';   label.Lp = 'standard length at puberty';bibkey.Lp = 'fishbase';
  comment.Lp = '8 to 10.2 cm';
data.Li = 17;     units.Li = 'cm';   label.Li = 'ultimate standard length';  bibkey.Li = 'fishbase';

data.Wwb = 9e-4; units.Wwb = 'g';    label.Wwb = 'dry weight at birth';    bibkey.Wwb = 'Ciec2013';
  comment.Wwb = 'based on egg diameter of 1.2 mm: pi/6*0.12^3';
data.Wwi = 50.5; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00457*(Li/0.86)^3.12, see F1';
  
data.Ri = 800/365;   units.Ri = '#/d';  label.Ri = 'maximum reprod rate';    bibkey.Ri = 'guess';   
  temp.Ri = C2K(8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.98';
  
% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), standard length (mm)
6.377	8.984
6.564	5.590
7.731	8.984
7.991	6.672
7.997	7.902
8.408	8.885
8.814	8.885
9.013	8.049
9.778	12.328
9.821	6.869
9.894	8.049
10.465	14.590
10.581	10.262
10.701	6.820
11.340	13.311
11.394	10.410
11.650	7.016
11.654	7.951
11.727	8.984
11.805	11.393
11.809	12.328
12.070	10.115
12.501	15.475
12.622	12.279
12.670	8.000
12.753	11.344
12.810	8.984
13.289	10.115
13.353	9.230
13.618	8.000
13.633	11.344
13.751	7.311
13.788	15.574
13.914	13.459
14.702	8.000
14.788	12.180
14.848	10.311
15.524	10.115
15.543	14.443
15.546	14.934
15.549	15.623
15.595	10.951
16.226	15.623
16.550	12.328
16.687	12.770
16.690	13.311
16.748	11.148
16.810	9.869
16.903	15.623
17.634	12.426
17.724	17.443
17.921	16.066
18.393	15.574
18.573	10.410
18.727	14.689
18.731	15.574
19.471	14.492
19.660	11.197
21.094	13.852
22.182	14.934
22.589	14.934
24.632	17.590
24.643	19.902
26.645	13.410
26.727	16.656
27.792	12.377
41.911	19.951];
data.tL(:,2) = data.tL(:,2)/ 10;  % convert mm to cm
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'}; 
temp.tL = C2K(15); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CastCast2003';

data.tL1 = [ ... % time since birth (d), total length (cm)
0.098	 5.691
1.205	 8.937
2.199	11.466
3.218	12.731
4.212	13.742];
data.tL1(:,1) = (0.8 + data.tL1(:,1)) * 365; % convert yr to d
data.tL1(:,2) = data.tL1(:,2) * 0.86; % convert TL to SL
units.tL1 = {'d', 'cm'};     label.tL1 = {'time since birth', 'standard length'};
temp.tL1 = C2K(10); units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'CarvCast2013';

%% set weights for all real data
weights = setweights(data, []);
weights.tL1 = 5 * weights.tL1;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
       
%% Facts
F1 = 'length-weight: Ww in g = 0.00457*(TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'total lengthstandard length: SL = 0.86 * TL, based on photo';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '6F8X5'; % Cat of Life
metaData.links.id_ITIS = '551338'; % ITIS
metaData.links.id_EoL = '46562563'; % Ency of Life
metaData.links.id_Wiki = 'Engraulis_anchoita'; % Wikipedia
metaData.links.id_ADW = 'Engraulis_anchoita'; % ADW
metaData.links.id_Taxo = '173701'; % Taxonomicon
metaData.links.id_WoRMS = '272284'; % WoRMS
metaData.links.id_fishbase = 'Engraulis-anchoita'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Engraulis_anchoita}}';  
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
bibkey = 'CastCast2003'; type = 'Article'; bib = [ ...  
'author = {Leandro Castello and Jorge P. Catello}, ' ...
'year = {2003}, ' ...
'title = {Anchovy stocks (\emph{Engraulis anchoita}) and larval growth in the {S}{W} {A}tlantic}, ' ... 
'journal = {Fisheries Research}, ' ...
'volume = {50}, '...
'pages = {409-421}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CarvCast2013'; type = 'Article'; bib = [ ...    
'doi = {103856/vol41-issue5-fulltext-2}, ' ...
'author = {Felipe M. Carvalho and Jorge P. Castello}, ' ...
'year  = {2013}, ' ...
'title = {Argentine anchovy (\emph{Engraulis anchoita}) stock identification and incipient exploitation in southern {B}razil}, ' ...  
'journal = {Lat. Am. J. Aquat. Res.}, ' ...
'volume = {41}, ' ...
'pages = {820-827}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Ciec2013'; type = 'Article'; bib = [ ...  
'doi = {10.1093/icesjms/30.3.281}, ' ...
'author = {Janina Dz. de Ciechomski}, ' ...
'year  = {2013}, ' ...
'title = {Development of the Larvae and Variations in the Size of the Eggs of the {A}rgentine Anchovy, \emph{Engraulis anchoita} {H}ubbs and {M}arini}, ' ...  
'journal = {ICES Journal of Marine Science}, ' ...
'volume = {30}, ' ...
'pages = {281-290}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Engraulis-anchoita.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
