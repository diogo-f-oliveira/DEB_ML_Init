function [data, auxData, metaData, txtData, weights] = mydata_Dendrodoa_grossularia

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Ascidiacea'; 
metaData.order      = 'Stolidobranchia'; 
metaData.family     = 'Styelidae';
metaData.species    = 'Dendrodoa_grossularia'; 
metaData.species_en = 'Baked bean ascidian';

metaData.ecoCode.climate = {'MC','ME'};
metaData.ecoCode.ecozone = {'MANE','MN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biP'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'};  
metaData.data_1     = {'t-L_T', 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2022 06 03];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 06 03]; 


%% set data
% zero-variate data;
data.ab = 11;     units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(10); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 2*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'Mill1954';   
  temp.am = C2K(10); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 0.4;  units.Lp  = 'cm';  label.Lp  = 'diameter at puberty'; bibkey.Lp  = 'Mill1954';
data.Li  = 1;    units.Li  = 'cm';  label.Li  = 'ultimate diameter'; bibkey.Li  = 'Mill1954';

data.Wwb  = 1.234e-5;   units.Wwb  = 'g';  label.Wwb  = 'wet weight at birth'; bibkey.Wwb  = 'Mill1954';
  comment.Wwb = 'based on egg diameter of 287 mum: pi/6*0.0287^3';
data.Wwi  = 0.42;  units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';   bibkey.Wwi  = 'guess';
  comment.Wwi = 'based on diameter 1 cm, height 0.8 cm: pi/6*1*1*0.8';

% uni-variate data at f
% time-body length
data.tL = [ ... % time settlement (d), diameter (cm)
  0 0.0100 % 1951/05/30
 12 0.0214 % 1951/06/11
 41 0.0890 % 1951/07/10
 77 0.1299 % 1951/08/15
111 0.2042 % 1951/09/18
139 0.2719 % 1951/10/16
173 0.2859 % 1951/11/19
204 0.2945 % 1951/12/20
216 0.3067 % 1952/01/01
303 0.2000 % 1952/03/28
348 0.3541 % 1952/05/12
394 0.5015 % 1952/06/27
423 0.5823 % 1952/07/26
];
units.tL = {'d', 'cm'}; label.tL = {'time since settlement', 'body diameter'};  
tT = [ ... % time since 1 jan (mnth), temperature (C)
 1	7.0684
 2	7.3408
 3	6.9592
 4	8.4104
 5	9.3378
 6	11.1803
 7	11.9777
 8	12.9053
 9	11.6075
10	10.8326
11	9.1428
12	6.9297];
tT = [tT; tT]; tT(1:12+12,1) = 1:12 + 12;
tT(:,1) = tT(:,1) * 30.5;  % convert mnth to d
tT(:,2) = C2K(tT(:,2));  % convert C to K
temp.tL = tT; units.temp.tL = 'K'; label.temp.tL = 'temperature';
settle.tL = 149; units.settle.tL = 'd'; label.settle.tL = 'time at settlement';
bibkey.tL = 'Mill1954'; 
comment.tL = 'Clyde: 1951/05/30 - 1952/07/26';

% length - egg number
data.LN = [ ... % body diameter (cm), number of eggs (#)
0.6015	23.0942
0.6110	33.8565
0.6186	0.6726
0.6506	10.5381
0.6686	9.6413
0.6801	13.9013
0.6810	34.9776
0.6852	27.5785
0.7147	29.8206
0.7215	31.1659
0.7582	44.6188
0.7779	31.1659
0.7866	23.3184
0.8405	16.1435
0.8644	45.9641
0.9806	19.2825];
units.LN = {'cm', '#'}; label.LN = {'body diameter', 'yearly fecundity'};  
temp.LN = C2K(10); units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Mill1954'; 
comment.LN = 'Clyde';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack data and txt_data for output
auxData.temp   = temp;
auxData.settle = settle;
txtData.units  = units;
txtData.label  = label;
txtData.bibkey = bibkey;
txtData.comment = comment;


%% Discussion points
D1 = 'temperature ranges from 7 C in Jan to 13 C in August';     
metaData.discussion = struct('D1',D1); 

%% Facts
F1 = 'Solitary tunicate; reproduction is entirely sexual, no budding';
metaData.bibkey.F1 = 'Mill1954';
F2 = 'Protandric hermaphroditic; external fertilisation';
metaData.bibkey.F2 = 'Wiki';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '34Q3R'; % Cat of Life
metaData.links.id_ITIS = '159293'; % ITIS
metaData.links.id_EoL = '46585055'; % Ency of Life
metaData.links.id_Wiki = 'Dendrodoa_grossularia'; % Wikipedia
metaData.links.id_ADW = 'Dendrodoa_grossularia'; % ADW
metaData.links.id_Taxo = '41527'; % Taxonomicon
metaData.links.id_WoRMS = '103882'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dendrodoa_grossularia}}'; 
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
bibkey = 'Mill1954'; type = 'article'; bib = [ ...
'doi = {10.1017/s0025315400003453 }, ' ...
'author = {R. H. Millar}, ' ...
'year = {1954}, ' ...
'title  = {THE ANNUAL GROWTH AND REPRODUCTIVE CYCLE OF THE ASCIDIAN \emph{Dendrodoa grossularia} (VAN {B}ENEDEN)}, ' ...
'journal = {J. Mar. biol. Ass. U.K.}, ' ...
'volume = {33}, '...
'pages = {33-48}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mill1970'; type = 'Book'; bib = [ ...  
'author = {Millar, R. H.}, ' ...
'year = {1970}, ' ...
'title  = {British Ascidians}, ' ...
'publisher = {Academic Press}, ' ...
'series = {Synopses of the British Fauna}, ' ...
'volume = {1}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

