  function [data, auxData, metaData, txtData, weights] = mydata_Micrurus_corallinus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Elapidae';
metaData.species    = 'Micrurus_corallinus'; 
metaData.species_en = 'Eastern coral snake'; 

metaData.ecoCode.climate = {'Am', 'BSk', 'Cfa'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'biTf', 'biTa'};
metaData.ecoCode.embryo  = {'Tns'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Ww_L'; 'Ri'};  
metaData.data_1     = {'t-L','L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 06 17];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 06 17]; 

%% set data
% zero-variate data
data.ab = 85.5;        units.ab = 'd';  label.ab = 'age at birth';        bibkey.ab = 'Marq1996';
  temp.ab = C2K(24); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '78 to 93 d';
data.am = 19*365;        units.am = 'd';  label.am = 'maximum life span';        bibkey.am = 'AnAge';
  temp.am = C2K(24); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'value for Micrurus_fulvius';
  
data.Lb = 18.7;      units.Lb = 'cm';     label.Lb = 'SVL at birth';  bibkey.Lb = 'Marq1996';
  comment.Lb = '177 to 197 mm';
data.Lp = 42.5;     units.Lp = 'cm';     label.Lp = 'total length at puberty for females'; bibkey.Lp = 'Marq1996'; 
data.Lpm = 44;     units.Lpm = 'cm';     label.Lpm = 'total length at puberty for males'; bibkey.Lpm = 'Marq1996'; 
data.Li = 95;     units.Li = 'cm';     label.Li = 'ultimate total length for females';  bibkey.Li = 'Marq1996';
data.Lim = 74;     units.Lim = 'cm';     label.Lim = 'ultimate total length for males';  bibkey.Lim = 'Marq1996';

data.Wwb = 2.39;     units.Wwb = 'g';     label.Wwb = 'weight at birth';  bibkey.Wwb = 'Marq1996';
  comment.Wwb = '2.02 to 2.76 g';
data.Ww60 = 33.3;    units.Ww60 = 'g';    label.Ww60 = 'weight at SVL 59.6 cm';  bibkey.Ww60 = 'Quin1979';
  comment.Ww60 = 'value for Micrurus_fulvius';
data.Ww55 = 30.1;    units.Ww55 = 'g';    label.Ww55 = 'weight at SVL 55.1 cm';  bibkey.Ww55 = 'Quin1979';
  comment.Ww55 = 'value for Micrurus_fulvius';

data.Ri = 12/365;  units.Ri = '#/d';  label.Ri = 'reprod rate at SVL 136.7 cm';  bibkey.Ri = 'Marq1996';   
  temp.Ri = C2K(24); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 to 12 eggs per clutch';
   
% univariate data
% time - length
data.tL = [ ... % time since birth (d), total length (cm)
61.000	20.937
61.734	25.550
61.734	23.676
61.734	21.514
61.734	20.361
61.734	19.784
62.505	22.956
62.505	22.235
91.829	23.556
92.600	24.998
92.600	26.151
122.696	22.283
183.658	27.232
304.038	31.075
365+0.000	37.898
365+0.772	39.196
365+31.638	35.328
365+60.962	36.216
365+62.505	37.515
365+181.343	45.248
365+182.886	40.925
365+183.658	48.998
365+212.981	51.183
365+272.400	53.969
365+275.486	52.097
365+275.486	55.701
365+276.258	56.855
365+303.266	58.029
365+304.810	57.021
365+304.810	56.012
365+304.810	54.859
365+304.810	54.283
365+304.810	52.985
365+304.810	52.120
365+304.810	50.246
365+305.581	49.094
365+305.581	46.788
365+305.581	46.211
365+306.353	47.221
365+334.133	55.171
365+334.133	56.612
365+334.133	59.062
365+334.905	49.982
365+334.905	52.144
365+335.677	42.775
365+335.677	44.073];
data.tL(:,1) = data.tL(:,1) - 61; % set origin of time at birth
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(24);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Marq1996';
comment.tL = 'data based on length frequencies';

% length - fecundity
data.LN = [ ... % SVL (cm), clutch size (#)
52.954	2
54.020	3
54.877	5
56.056	4
56.112	3
56.525	2
56.607	6
57.030	3
58.056	2
58.147	4
59.051	7
60.030	5
61.051	5
62.592	3
65.148	2
79.908	9
81.398	7
82.801	12];
units.LN  = {'cm', '#'};  label.LN = {'SVL', 'fecundity'};  
temp.LN   = C2K(24);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Marq1996';

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
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '6RJKH'; % Cat of Life
metaData.links.id_ITIS = '700585'; % ITIS
metaData.links.id_EoL = '962867'; % Ency of Life
metaData.links.id_Wiki = 'Micrurus_corallinus'; % Wikipedia
metaData.links.id_ADW = 'Micrurus_corallinus'; % ADW
metaData.links.id_Taxo = '50227'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Micrurus&species=corallinus'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Micrurus_corallinus}}';
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
bibkey = 'Marq1996'; type = 'Article'; bib = [ ...  
'author = {Otavio A.V. Marques}, ' ...
'year = {1996}, ' ...
'title = {Reproduction, seasonal activity and growth of the coral snake, \emph{Micrurus corallinus} ({E}lapidae), in the southeastern {A}tlantic forest in {B}razil}, ' ... 
'journal = {Amphibia-Reptilia}, ' ...
'volume = {17}, '...
'pages = {277-285}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'Quin1979'; type = 'Article'; bib = [ ...  
'author = {Hugh R. Quinn}, ' ...
'year = {1979}, ' ...
'title = {Reproduction and Growth of the {T}exas Coral Snake (\emph{Micrurus fulvius tenere})}, ' ... 
'journal = {Copeia}, ' ...
'volume = {1979(3)}, '...
'pages = {453-463}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Micrurus_fulvius}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


