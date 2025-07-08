function [data, auxData, metaData, txtData, weights] = mydata_Ramphastos_toco

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Piciformes'; 
metaData.family     = 'Ramphastidae';
metaData.species    = 'Ramphastos_toco'; 
metaData.species_en = 'Toco toucan'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTi'};
metaData.ecoCode.embryo  = {'Tnwfm', 'Tntfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCii', 'biCvr', 'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.8); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Carlos MGL Teixeira'};    
metaData.date_subm = [2012 07 31];              
metaData.email    = {'carlos.teixeira@tecnico.ulisboa.pt'};            
metaData.address  = {'Lisbon University'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 11 26];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2022 11 30];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_3     = [2023 07 04];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 04];

%% set data
% zero-variate data

data.ab = 17.5;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Sedg2010';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temp from Seib2001, LegeVinc2012';
data.tx = 47.5;  units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Sedg2010';   
  temp.tx = C2K(41.8); units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'temp from McNa2001';
data.tp = 142.5;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.8); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'temp from McNa2001';
data.tR = 1095;  units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'ADW';
  temp.tR = C2K(41.8); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 9490;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'ADW';   
  temp.am = C2K(41.8); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 61;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'ADW';

data.Wwb = 16;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Gard1992';
data.Wwi = 665.63; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Sedg2010';

data.Ri = 3/365;  units.Ri  = '#/d';   label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Sedg2010';   
  temp.Ri = C2K(41.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
1   18.7429919;
1.1	19.38159395;
2	22.92026503;
3	29.03623034;
4	38.37414038;
5	44.81239008;
6	48.99505777;
7	56.07763102;
8	61.87139369;
9	69.27616958;
10	76.68094548;
12	87.30774785;
13	96.32353699;
13.1	106.9505028;
14	117.8996713;
15	129.1709607;
16	139.1531943;
17	161.379292;
19	191.3381714;
20	198.4208264;
20.1	216.4585349;
21	239.0068352;
22	260.9106484;
23	275.0818434;
24	290.5416037;
25	313.7343911;
26	334.6716781;
27	347.8760199;
29	372.3575361;
30	397.4833759;
31	404.8883152;
32	422.2813732;
32.1	436.7746891;
33	446.1127626;
34	458.0284573;
35	464.7887461;
36	470.9048749;
38	487.0088771;
38.1	498.924817;
39	497.9523241;
40	496.9799129;
41	509.5398494;
42	512.7560726;
43	520.8051721;
45	534.3317165;
45.1	530.4595632;
46	526.9094492;
47	533.0254145;
48	511.7543183;
49	492.0939901;
50	497.5657953;
51	510.7701371;
52	504.6424018;
53	496.9036533;
55	476.9155645;
60	550.0262222];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.8);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'LegeVinc2012';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Food availability in tW data varies';
D2 = 'mod_2: v is reduced';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '78R6G'; % Cat of Life
metaData.links.id_ITIS = '554317'; % ITIS
metaData.links.id_EoL = '45512578'; % Ency of Life
metaData.links.id_Wiki = 'Ramphastos_toco'; % Wikipedia
metaData.links.id_ADW = 'Ramphastos_toco'; % ADW
metaData.links.id_Taxo = '55573'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'D42641C0E83A2C10'; % avibase
metaData.links.id_birdlife = 'toco-toucan-ramphastos-toco'; % birdlife
metaData.links.id_AnAge = 'Ramphastos_toco'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ramphastos_toco}}';
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
bibkey = 'McNa2001'; type = 'Article'; bib = [ ... 
'author = {McNab, B.K.}, ' ... 
'year = {2001}, ' ...
'title = {Energetics of Toucans, a Barbet, and a Hornbill: Implications for avian frugivory}, ' ...
'journal = {The Auk}, ' ...
'volume = {118}, ' ...
'number = {4}, '...
'pages = {916--933}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Sedg2010'; type = 'Incollection'; bib = [ ... 
'author = {Sedgwick, C. W.}, ' ... 
'year = {2010}, ' ...
'title = {Toco Toucan (\emph{Ramphastos toco})}, ' ...
'howpublished = {\url{http://neotropical.birds.cornell.edu}}, '  ...
'booktitle = {Neotropical Birds Online}, ' ...
'editor = {Schulenberg, T. S.}, ' ...
'publisher = {Cornell Lab of Ornithology}, '...
'address = {Ithaca}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LegeVinc2012'; type = 'Article'; bib = [ ... 
'author = {St. Leger, J. and Vince, M. and Jennings, J. and McKerney, E. and Nilson, E.}, ' ... 
'year = {2012}, ' ...
'title = {Toucan Hand Feeding and Neslting Growth}, ' ...
'journal = {Exotic Animal Practice}, ' ...
'volume = {15}, ' ...
'pages = {183--193}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Ramphastos_toco/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Gard1992'; type = 'Misc'; bib = [ ...
'author = {Gardner, L.}, ' ... 
'year = {1992}, ' ...
'title = {Toco Toucan Leeds Castle Protocol}, ' ...
'howpublished = {\url{http://www.avianrearingresource.co.uk/species/documents/59.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinPres1991'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0300-9629(91)90122-S}, ' ...
'author = {R. Prinzinger and A.Pre{\ss}mar and E. Schleucher}, ' ... 
'year = {1991}, ' ...
'title = {Body temperature in birds}, ' ...
'journal = {Comp. Biochem. Physiol.}, ' ...
'volume = {99A(4)}, ' ...
'pages = {499-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

